package TMS::Test::Core::FinInvoiceAmount;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'PaymentTermsId' => ' ',
    'FactoredParent' => ' ',
    'Notes'          => ' ',
    'Comments'       => ' ',
    'InvoiceId'      => ' ',
    'RefNumber'      => ' ',
    'DateCreated'    => ' ',
    'PONumber'       => ' ',
    'DateInvoiced'   => ' ',
    'Amount'         => ' ',
    'Status'         => ' ',
    'EntityId'       => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinInvoiceAmount';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
