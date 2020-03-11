#!/usr/bin/env perl
BEGIN {
    use Cwd 'abs_path';
    use File::Basename;
    my $cur = abs_path(dirname(abs_path($0)));
    (my $lib = $cur) =~ s/\/lib\/.*/\/lib/;
    push @INC, ($cur, $lib);
}

use strict;
use warnings FATAL => 'all';
use feature 'current_sub';

use File::Path 'make_path';
use Devel::Confess;
use Data::Dumper;
use Tie::IxHash;
use Perl::Tidy;
use Try::Tiny;
use Carp;
use JSON;

$Data::Dumper::Terse = 1;

my $PostFile = $ARGV[0];    # Read TEMP filename from Dancer
my $PID      = fork();      # try to fork
exit 0 if $PID;             # let Dancer do whatever, parent exists

# ---------------------------------------------------------------------------------------------------------------------
my $JSON             = JSON->new->utf8->allow_nonref->indent->space_after->space_before;
my $PostJson         = ReadFile($PostFile);
my $PostRcrd         = $JSON->decode($PostJson);
my $FeatureTemplates = {};
my $TemplateBase     = $$PostRcrd{TemplateBase};
my $FeaturesBase     = $$PostRcrd{FeaturesBase};
my $RoutesBase       = $$PostRcrd{RoutesBase};
my $PostData         = $$PostRcrd{PostedData};

unlink($PostFile);

$$FeatureTemplates{$_} = ReadFile("$TemplateBase/$_.pm") foreach qw( FeatureClass DancerRoute );

confess "Missing FeatureName" unless defined $$PostData{Feature} && $$PostData{Feature} =~ /\S+/;
$$PostData{Feature} =~ s/\s+//g;

confess "Missing Route" unless defined $$PostData{Route} && $$PostData{Route} =~ /\S+/;
$$PostData{Route} =~ s/\s+//g;

my $CoreAPI          = $$PostData{TopLevel};
my $CoreDependences  = [$CoreAPI];
my $PrefetchRcrd     = PrefetchLoop($$PostData{Selected}, $CoreDependences);
my $FeatureTemplate  = $$FeatureTemplates{FeatureClass};
my $RouteTemplate    = $$FeatureTemplates{DancerRoute};
my $FeatureClassName = $$PostData{Feature};
my $FeatureClassFile = "$FeaturesBase/$FeatureClassName";
my $FeatureRoute     = $$PostData{Route};
my $PrefetchText     = Dumper($PrefetchRcrd);
my $FeatureClassData = undef;
my %DependencesList  = map { $_, 1 } @$CoreDependences;
my $DependencyText   = join("\n", map {"use TMS::API::Core::$_;"} sort keys %DependencesList);
my $JsonSample       = SampleJson($$PostData{Selected});

$FeatureClassName =~ s/\//::/g;

$FeatureTemplate =~ s/FEATURECLASSNAME/$FeatureClassName/s;
$FeatureTemplate =~ s/FEATUREPATH/$FeatureClassFile/s;
$FeatureTemplate =~ s/COREAPINAME/$CoreAPI/s;
$FeatureTemplate =~ s/PREFETCHDATA/$PrefetchText/s;
$FeatureTemplate =~ s/DEPENDENCIES/$DependencyText/s;

$RouteTemplate =~ s/FEATURECLASSNAME/$FeatureClassName/gs;
$RouteTemplate =~ s/THEROUTE/$FeatureRoute/s;

my $argv = "-npro";    # Ignore any .perltidyrc at this site
$argv .= " -pbp";      # Format according to perl best practices
$argv .= " -nst";      # Must turn off -st in case -pbp is specified
$argv .= " -se";       # -se appends the errorfile to stderr

Perl::Tidy::perltidy(argv => $argv, source => \$FeatureTemplate, destination => \$FeatureClassData);

SaveFile("$FeatureClassFile.sample.json", $JSON->encode($JsonSample));
SaveFile("$FeatureClassFile.pm",          $FeatureClassData);
SaveFile("$RoutesBase/$FeatureRoute.pm",  $RouteTemplate);

#----------------------------------------------------------------------------------------------------------------------
sub ReadFile {
    my $filename = shift;
    my $filedata = undef;
    local $/ = undef;
    open(FI, "<$filename") || confess "Unable to read file \"$filename\", $!";
    $filedata = <FI>;
    close(FI);
    return $filedata;
}

#----------------------------------------------------------------------------------------------------------------------
sub SaveFile {
    my $FileName = shift;
    my $FileData = shift;
    my $FileFldr = $FileName;

    $FileFldr =~ s/\/[^\/]+$//;
    if (!-d "$FileFldr") {
        my $created = make_path($FileFldr, {chmod => 0775});
        confess "Unable to create folder: \"$FileFldr\", $!" if !$created;
    }
    if (open(FO, ">$FileName")) {
        print FO $FileData;
        close(FO);

        PushToGit($FileName)
    } else {
        confess "Unable to save \"$FileName\", $!";
    }
}

#----------------------------------------------------------------------------------------------------------------------
# hardcoded and TMS specific with no error checkings
sub PushToGit {
    my $FileName = shift;
    my $GitComment = $$PostData{GitComment};
    my $GitBase = $FileName;

    return if $GitComment !~ /\S+/;
    return if $FileName !~ /lib\/TMS\//;

    $GitComment =~ s/^\s+//;
    $GitComment =~ s/\s+$//;
    $GitComment =~ s/\s+/ /g;

    $GitBase =~ s/lib\/TMS.*//;
    $FileName =~ s/.*lib\/TMS\//lib\/TMS\//;

    print `cd $GitBase && /usr/local/bin/git add $FileName 2>&1`;
    print `cd $GitBase && /usr/local/bin/git commit -m "$GitComment" $FileName 2>&1`;
}

#----------------------------------------------------------------------------------------------------------------------
sub SampleJson {
    my ($tree, $json) = @_;
    return undef if ref($tree) ne 'HASH';
    return undef if !exists $$tree{columns};

    if (!defined $json) {
        $json = {};
        tie %$json, 'Tie::IxHash';
    }
    $$json{$$_{name}} = $$_{data_type} foreach @{$$tree{columns}};

    return undef if !exists $$tree{'related'};
    foreach my $type (qw(belongsto hasmany)) {
        if (exists $$tree{'related'}{$type}) {
            foreach my $rec (@{$$tree{'related'}{$type}}) {
                next if !$$rec{checked};
                my $subset = {};
                tie %$subset, 'Tie::IxHash';

                if ($type eq 'hasmany') {
                    push @{$$json{$$rec{relationship}}}, $subset;
                    __SUB__->($$rec{subset}, $$json{$$rec{relationship}}[0]);
                } else {
                    $$json{$$rec{relationship}} = $subset;
                    __SUB__->($$rec{subset}, $$json{$$rec{relationship}});
                }
            }
        }
    }
    return $json;
}

#----------------------------------------------------------------------------------------------------------------------
sub PrefetchLoop {
    my ($tree, $dependency) = @_;
    return undef if ref($tree) ne 'HASH';
    return undef if !exists $$tree{'related'};

    my $prefetch = undef;
    foreach my $type (qw(belongsto hasmany)) {
        next if !exists $$tree{'related'}{$type};
        foreach my $rec (@{$$tree{'related'}{$type}}) {
            next if !$$rec{checked};
            push @$dependency, $$rec{source};
            my $subset = undef;
            if (exists $$rec{subset} && defined $$rec{subset} && ref($$rec{subset}) eq 'HASH') {
                $subset = __SUB__->($$rec{subset}, $dependency);
            }
            push @$prefetch, defined $subset ? {$$rec{relationship} => $subset} : $$rec{relationship};
        }
    }
    return $prefetch;
}
