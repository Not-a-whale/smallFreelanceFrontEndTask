package TMS::Test::Core::FinInvoiceAmount;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'PONumber'       => ' ',
    'Notes'          => ' ',
    'RefNumber'      => ' ',
    'Amount'         => ' ',
    'Status'         => ' ',
    'PaymentTermsId' => ' ',
    'EntityId'       => ' ',
    'Comments'       => ' ',
    'InvoiceId'      => ' ',
    'DateInvoiced'   => ' ',
    'FactoredParent' => ' ',
    'DateCreated'    => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinInvoiceAmount';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
