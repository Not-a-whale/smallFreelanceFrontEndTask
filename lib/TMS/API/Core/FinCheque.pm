package TMS::API::Core::FinCheque;

# $Id: $
use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use namespace::autoclean;
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;

use Moose;

# AUTO-GENERATED DEPENDENCIES START
use TMS::API::Core::FinTransaction;
use TMS::API::Core::BizBranch;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::Entity;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has ChequeId           => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has ChequeNumber       => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Int',);
has TransactionId      => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'FinTransactionObj',);
has CreatedBy          => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'HrAssociateObj',);
has AuthorizedBy       => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'HrAssociateObj',);
has VoidedBy           => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'HrAssociateObj',);
has Payer              => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EntityObj',);
has Payee              => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EntityObj',);
has Bank               => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'BizBranchObj',);
has Amount             => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'Float',);
has Memo               => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has PayerName          => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has PayerStreetAddress => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has PayerCityAddress   => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has PayerPhone         => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has PayeeName          => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has PayeeStreetAddress => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has PayeeCityAddress   => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has PayeePhone         => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has BankName           => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has BankStreetAddress  => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has BankCityAddress    => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has BankPhone          => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has BankRoutingNumber  => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has BankAccountNumber  => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has DateCreated        => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has DateVoided         => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has DateAuthorized     => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);

# AUTO-GENERATED HAS-A END

1;

