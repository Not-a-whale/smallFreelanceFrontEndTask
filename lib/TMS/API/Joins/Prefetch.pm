package TMS::API::Joins::Prefetch;

use strict;
use warnings FATAL => 'all';
use namespace::autoclean;

use Moose;
has prefetch => (is => 'rw', isa => 'Undef|HashRef|ArrayRef', builder => '_build_prefetch');

sub joins {
    my ($self, $name, $type) = @_;
    my $fetch = $self->prefetch();
    return $name if !defined $fetch;
    return {$name => $fetch};
#    return {$name => $fetch} if $type eq 'belongsto';
#    return {$name => [$fetch]};
}
1;
