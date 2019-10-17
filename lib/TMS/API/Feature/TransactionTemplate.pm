package TMS::API::Feature::TransactionTemplate;

use TMS::API::Core::FinItemTemplate;
use TMS::API::Core::FinItemTemplatesTree;
use TMS::API::Core::FinItemTemplatesType;
use TMS::API::Core::FinAccount;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::Entity;
use TMS::API::Core::FinTransactionType;

use Data::Dumper;
use Carp qw(confess longmess);
use Try::Tiny;

my $prefetch_fullinfo = [
    "updated_by", "transaction_type",
    "template_type", { "entity" => [ 'person', 'business' ] },
    "deleted_by",     "debit_account",
    "credit_account", "created_by"
];

sub list {
    my $hdl = TMS::API::Core::FinItemTemplate->new(
        TemplateTypeId => undef,
        Name           => undef
    );

    my @data = $hdl->Search(
        { "me.ParentId" => undef },
        {
            prefetch => $prefetch_fullinfo
        }
    )->hashref_array;

    my $response = {
        POST        => undef,
        ERROR       => undef,
        DATA        => { "list" => \@data },
        ENVIRONMENT => undef,
    };
}

sub children_id {
    my $args = shift;
    my $id = $$args{id} || confess "No id provided";

    my $hdl = TMS::API::Core::FinItemTemplate->new(
        TemplateTypeId => undef,
        Name           => undef
    );

    my @data =
      $hdl->ResultSet()
      ->related_resultset('fin_item_templates_trees_ancestors')->search(
        {
            AncestorId => $id
        },
        {
            prefetch => {
                "descendant" => $prefetch_fullinfo
            }
        }
    )->hashref_array;

    my @data = map { $$_{descendant} } @data;

    # this should be part of DBIX ... ResultSet class
    foreach my $d (@data) {
        if ( defined $$d{entity} ) {
            my $name   = undef;
            my $entity = $$d{entity};
            if ( defined $$entity{person} ) {
                my $person = $$entity{person};
                $name = $$person{FirstName} . ' ' . $$person{LastName};
            }
            elsif ( defined $$entity{business} ) {
                $name = $$entity{business}{BizName};
            }

            $$entity{Name} = $name;
        }
    }

    my $response = {
        POST        => undef,
        ERROR       => undef,
        DATA        => { "children" => \@data },
        ENVIRONMENT => undef,

    };
    return $response;
}

sub children {
    my $args = shift;
    my $root = $$args{root} || confess "No root provided";

    my $hdl = TMS::API::Core::FinItemTemplate->new(
        TemplateTypeId => undef,
        Name           => undef
    );

    my @data =
      $hdl->ResultSet()
      ->related_resultset('fin_item_templates_trees_ancestors')->search(
        {
            AncestorId => $$root{ItemTemplateId}
        },
        {
            prefetch => {
                "descendant" => $prefetch_fullinfo
            }
        }
    )->hashref_array;

    my @data = map { $$_{descendant} } @data;

    foreach my $d (@data) {
        if ( defined $$d{entity} ) {
            my $name   = undef;
            my $entity = $$d{entity};
            if ( defined $$entity{person} ) {
                my $person = $$entity{person};
                $name = $$person{FirstName} . ' ' . $$person{LastName};
            }
            elsif ( defined $$entity{business} ) {
                $name = $$entity{business}{BizName};
            }

            $$entity{Name} = $name;
        }
    }

    my $response = {
        POST        => undef,
        ERROR       => undef,
        DATA        => { "children" => \@data },
        ENVIRONMENT => undef,

    };
    return $response;
}

sub generate_transactions {
    my $template = "";
}

1;
