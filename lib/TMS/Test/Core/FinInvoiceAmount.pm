package TMS::Test::Core::FinInvoiceAmount;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'Comments'       => ' ',
    'InvoiceId'      => ' ',
    'Status'         => ' ',
    'Notes'          => ' ',
    'RefNumber'      => ' ',
    'Amount'         => ' ',
    'DateCreated'    => ' ',
    'PONumber'       => ' ',
    'EntityId'       => ' ',
    'FactoredParent' => ' ',
    'DateInvoiced'   => ' ',
    'PaymentTermsId' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinInvoiceAmount';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
