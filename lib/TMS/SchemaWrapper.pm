package TMS::SchemaWrapper;
use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use namespace::autoclean;
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;

use Moose;
use TMS::Schema;

my $SchemaObj = undef;

sub Schema {
    $SchemaObj = TMS::Schema->new(host => '192.168.11.7')->DBIxHandle if !defined $SchemaObj;
    return $SchemaObj;
}

sub ResultSet {
    my $self = shift;
    (my $name = ref($self)) =~ s/.*:://g;
    return $self->Schema->DBIxHandle->resultset($name);
}

sub _meta_loop {
    $DB::single = 2;
    my $self   = shift;
    my $method = (caller(1))[3];
    my $data   = {};
    for my $attr ($self->meta->get_all_attributes) {
        my $name = $attr->name;
        my $type = ref($$self{$name});
        if ($type =~ /TMS::/) {
            $$data{$name} = $self->$name->$method;
        } else {
            $$data{$name} = $self->$name if defined $self->$name;
        }
    }
    return $data;
}

sub DataHash { shift->_meta_loop }

sub UpdateOrCreate {
    my $self = shift;
    my $row  = $self->ResultSet->update_or_create($self->_meta_loop);
    return $row->id;
}

sub Create {
    my $self = shift;
    my $row  = $self->ResultSet->create($self->_meta_loop);
    return $row->id;
}

sub Find {
    my $self = shift;
    my $row  = $self->ResultSet->find($self->_meta_loop);
    return $row->id;
}

sub FindOrCreate {
    my $self = shift;
    my $row  = $self->ResultSet->find_or_create($self->_meta_loop);
    return $row->id;
}

sub Update {
    my $self = shift;
    my $row  = $self->ResultSet->update($self->_meta_loop);
    return $row->id;
}

sub Delete {
    my $self = shift;
    my $row = $self->ResultSet->find($self ->DataHash);
    return undef unless $row;
    $row->delete->in_storage;
}

sub Search {
    my $self = shift;
    return [$self->ResultSet->search(@_)->hashref_array()];
}

1;