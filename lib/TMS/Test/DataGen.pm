# $Id: $
package TMS::Test::DataGen;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;

use Test::More;
use Moose::Role;

$Data::Dumper::Terse = 1;

my $OrigData = undef;
my $RdbsData = undef;

before [qw( Create Update UpdateOrCreate )] => sub {
    $OrigData = undef;
    $RdbsData = undef;
};

after [qw( Create Update UpdateOrCreate )] => sub {
    my $self     = shift;
    my $Info     = $self->ColumnsInfo;
    my $OrigData = $self->DataHash;
    my $RdbsRows = $self->Show;
    if (ref($RdbsRows) eq 'ARRAY' && scalar(@$RdbsRows)) {
        confess "More than one row is returned during verification" if scalar(@$RdbsRows) > 1;
        my $RdbsData = $RdbsRows->[0];
        foreach my $name (keys %$Info) {
            if ($$Info{$name}{data_type} eq 'enum' || $$Info{$name}{data_type} eq 'set') {
                $$RdbsData{$name} = join(",", sort map { lc($_) } split(',', $$RdbsData{$name})) if exists $$RdbsData{$name};
                $$OrigData{$name} = join(",", sort map { lc($_) } split(',', $$OrigData{$name})) if exists $$OrigData{$name};
            }
        }
    }
};

sub DataCompare {
    my $self = shift;
    my $text = shift;
    my $NoPK = shift;

    if (defined $NoPK && $NoPK) {
        foreach ($self->PrimaryColumns) {
            delete $$OrigData{$_} if exists $$OrigData{$_};
            delete $$RdbsData{$_} if exists $$RdbsData{$_};
        }
    }
    is_deeply($OrigData, $RdbsData, $text);
}

sub DataRebuild {
    my $self = shift;
    my %prim = map { $_, 1 } $self->PrimaryColumns;
    my %data = map { $_, exists $prim{$_} ? undef : ' ' } $self->ColumnsList;
    return $self->new(%data)->DataHash;
}

sub DataHash {
    my $self = shift;
    my $data = undef;
    my %list = map { $_, 1 } $self->ColumnsList;
    for my $attr ($self->meta->get_all_attributes) {
        my $name = $attr->name;
        next if !exists $list{$name};
        my $type = ref($$self{$name});

        $$data{$name} = $type =~ /TMS::/ ? $self->$name->DataHash() : $self->$name if defined $self->$name;
    }
    return $data;
}

sub DataTell {
    my $self = shift;
    my $text = Dumper(@_);
    $text =~ s/^/     /gm;
    print "$text\n";
}

1;
