package TMS::CLI;

# $Id: CLI.pm,v 1.7 2019/06/17 18:05:24 cpeter Exp cpeter $

use strict;
use warnings FATAL => 'all';
use Getopt::Long qw(:config pass_through);
use Devel::Confess;
use File::Basename;
use Data::Dumper;
use Carp;
use Cwd qw(abs_path);

require Exporter;
use vars qw(@ISA @EXPORT);
@ISA    = qw(Exporter);
@EXPORT = qw(ParseCLI);

=head1 Parse CLI parameters based on input rules and return results as hashref.

    my $CLI = {
        quiet => {
            isa     => 'Bool',
            alias   => 'q',
            comment => 'Output nothing while working',
        },
        help => { about => 'Basic CLI processor based on Getopt::Long library'},
        group => {
            isa      => 'Str',
            required => 1,
            alias    => 'g',
            default  => 'express',
            comment  => "Department/Group - 'expedite' or 'express'",
        }
    };
    print Dumper(ProcessCLI(rules => $CLI, isfatal => 1));

=cut

sub ParseCLI {
    my %args      = @_;
    my $out       = undef;
    my @errors    = ();
    my $showhelp  = 1;
    my @usage     = ();
    my $maxlength = 0;
    my $maxtype   = 0;
    my @required  = ();
    my @optional  = ();
    my $defaults  = undef;
    my $cli       = undef;

    if (defined $0) {
        my $name = abs_path($0);
        $name =~ s/\.pl$//;
        $name .= ".json";
        if (-f $name && open(FI, "<", "$name")) {
            local $/ = undef;
            my $json = <FI>;
            close(FI);
            $defaults = JSON->new->allow_nonref->decode($json);
        }
    }

    if (ref($defaults) eq 'HASH' && exists $$defaults{rules}) {
        $cli = $$defaults{rules};
    }

    if (exists $args{rules} && ref($args{rules}) eq 'HASH') {
        $$cli{$_} = $args{rules}{$_} foreach keys %{$args{rules}};
    }
    confess "no 'rules' given" unless defined $cli && ref($cli) eq 'HASH';

    $$cli{help}{isa}     ||= 'Bool';
    $$cli{help}{comment} ||= 'display this help';

    my $ShortHandAliases = undef;

    foreach my $opt (sort keys %$cli) {
        my $type = undef;
        $maxlength = length($opt) > $maxlength ? length($opt) : $maxlength;

        $$ShortHandAliases{$$cli{$opt}{alias}} = $opt if exists $$cli{$opt}{alias} && defined $$cli{$opt}{alias};

        if (exists $$cli{$opt}{isa} && defined $$cli{$opt}{isa}) {
            $maxtype = length($$cli{$opt}{isa}) > $maxtype ? length($$cli{$opt}{isa}) : $maxtype;
            $type = 's'   if $$cli{$opt}{isa} eq 'Str';
            $type = 'i'   if $$cli{$opt}{isa} eq 'Int';
            $type = undef if $$cli{$opt}{isa} eq 'Bool';
        }

        my @possibleotions = ($opt);
        if (exists $$cli{$opt}{alias} && defined $$cli{$opt}{alias}) {
            if (ref($$cli{$opt}{alias}) eq 'array') {
                push @possibleotions, $_ foreach (grep {defined} @{$$cli{$opt}{alias}});
            } elsif (!ref($$cli{$opt}{alias})) {
                push @possibleotions, $$cli{$opt}{alias};
            }
        }

        foreach (@possibleotions) {
            my $isa = $type ? "$_=$type" : $_;
            GetOptions($isa, \$out->{$opt});
            if (defined $out->{$opt}) {
                $showhelp = undef;
                last;
            }
        }

        $$cli{$opt}{comment} = '' unless (exists $$cli{$opt}{comment} && defined $$cli{$opt}{comment});

        if (!defined $out->{$opt}) {
            if (exists $$cli{$opt}{default}) {
                $$out{$opt} = $$cli{$opt}{default};
            } else {
                if (exists $$cli{$opt}{required} && defined $$cli{$opt}{required}) {
                    push @errors, "missing option \"-$opt\". $$cli{$opt}{comment}" if !defined $out->{$opt};
                }
            }
        }

        if (exists $$cli{$opt}{required} && defined $$cli{$opt}{required}) {
            $$cli{$opt}{required} = 'required';
            push @required, $opt;
        } else {
            $$cli{$opt}{required} = 'optional';
            push @optional, $opt;
        }

        $$cli{$opt}{default} = exists $$cli{$opt}{default} ? $$cli{$opt}{default} : undef;
        push @usage,
            [
            $opt, $$cli{$opt}{required},
            "$$cli{$opt}{isa}",
            $$cli{$opt}{comment},
            $$cli{$opt}{default} ? ' Default: ' . $$cli{$opt}{default} : ''
            ];
    }

    if ($showhelp || (exists($$out{help}) && defined($$out{help})) || scalar(@errors)) {
        my $myname = basename($0);
        if (exists $$cli{help}{about} && defined $$cli{help}{about} && $$cli{help}{about} =~ /\w+/) {
            print "$$cli{help}{about}\n";
        }
        print "Syntax:\n";
        print "  $myname";
        foreach (@required) {
            my $optn = "-$_";
            $optn .= " $$cli{$_}{isa}" if exists $$cli{$_}{isa} && defined $$cli{$_}{isa} && $$cli{$_}{isa} ne 'bool';
            print " $optn";
        }
        foreach (@optional) {
            my $optn = "-$_";
            $optn .= " $$cli{$_}{isa}" if exists $$cli{$_}{isa} && defined $$cli{$_}{isa} && $$cli{$_}{isa} ne 'bool';
            print " [$optn]";
        }
        print "\n\nOptions:\n";

        $maxlength += 1;
        $maxtype   += 1;
        my $fmt = '  --%-' . $maxlength . 's (%s)    %-' . $maxtype . 's %s %s';
        printf "$fmt\n", @$_ foreach @usage;

        if( $ShortHandAliases && ref($ShortHandAliases) eq 'HASH' ) {
            print "\nSome shorthand aliases:\n";
            foreach(sort keys %$ShortHandAliases) {
                print "    \-$_  is  \--$$ShortHandAliases{$_}\n";
            }
        }
    }

    if (scalar(@errors)) {
        my $error = "\nErrors:\n  " . join("\n  ", @errors) . "\n";
        if (   (exists $args{isfatal} && defined $args{isfatal} && $args{isfatal})
            || (exists $$defaults{isfatal} && defined $$defaults{isfatal} && $$defaults{isfatal})) {
            confess $error;
        } else {
            print "\n----------------------------------------------------------------\n";
            print $error;
        }
        $out = undef;
    }
    return $out;
} ## end sub ParseCLI
1;
