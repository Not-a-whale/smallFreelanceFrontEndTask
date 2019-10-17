use TMS::API::Feature::TransactionTemplate;
use Carp qw(confess longmess);
use Data::Dumper;
use TMS::API::Core::Entity;
use TMS::API::Core::FinAccount;
use TMS::API::Core::FinTransactionType;
use TMS::API::Core::FinItemTemplate;
use TMS::API::Core::FinItemTemplatesType;

prefix '/api' => sub {
    prefix '/transactiontemplate' => sub {
        get '/detail'           => \&chargeitem_detail;
        get '/list'             => \&chargeitem_list;
        post '/children'        => \&chargeitem_children;
        get '/entitylist'       => \&chargeitem_entity_list;
        get '/accountlist'      => \&chargeitem_account_list;
        get '/transtypelist'    => \&chargeitem_transtype_list;
        get '/templatetypelist' => \&chargeitem_templatetype_list;
        post '/create'          => \&chargeitem_create;
        post '/update'          => \&chargeitem_update;
    };
};

sub chargeitem_detail {
    my $id  = query_parameters->get('id');
    my $hdl = TMS::API::Core::FinItemTemplate->new(
        Name           => undef,
        TemplateTypeId => undef,
    );

    my $data = $hdl->Search( { ItemTemplateId => $id } )->hashref_array;

    my $response = { DATA => { item => $data } };
    return $response;
}

sub chargeitem_create {
    my $data = body_parameters->get('POST');

    my $hdl = TMS::API::Core::FinItemTemplate->new(
        Name           => undef,
        TemplateTypeId => undef
    );

    $hdl->Transaction(
        sub {
            my $templateName    = $$data{templateName};
            my $templateType    = $$data{templateType};
            my $transactionType = $$data{transactionType};
            my $rs              = $hdl->ResultSet;

            my $root = $rs->update_or_create(
                {
                    Name            => $templateName,
                    TemplateTypeId  => $templateType,
                    TransactionType => $transactionType,
                }
            );
            my $root_hashref =
              $hdl->Find( { ItemTemplateId => $$rs{ItemTemplateId} } );

            my $children = $$data{children};

            #print Dumper($children);
            # because i dont want it to be recursive
            my $stack = ();
            push @$stack, @$children;
            while ( scalar @$stack > 0 ) {
                my $item   = shift @$stack;
                my $parent = $$item{ParentId};
                if ( defined $parent ) {
                    push @$stack, $$item{ParentId};
                }
                else {
                    $$item{ParentId} = $root_hashref;
                }
            }

            foreach my $child (@$children) {
                print Dumper($child);
                $hdl = TMS::API::Core::FinItemTemplate->new($child);
                $hdl->UpdateOrCreate;
            }
        }
    );

    return 200;
}

sub chargeitem_update {

}

sub chargeitem_templatetype_list {
    my $hdl = TMS::API::Core::FinItemTemplatesType->new(
        Name        => undef,
        Description => undef
    );
    my @data = $hdl->ResultSet->search()->hashref_array;

    return { DATA => { list => \@data } };
}

sub chargeitem_transtype_list {
    my $hdl = TMS::API::Core::FinTransactionType->new( TransTypeName => undef );
    my @data = $hdl->Show(undef);

    return { DATA => { list => \@data } };
}

sub chargeitem_account_list {
    my $hdl =
      TMS::API::Core::FinAccount->new( AccountTypeId => undef, Name => undef );
    my @data = $hdl->ResultSet->search()->hashref_array;

    return { DATA => { list => \@data } };
}

sub chargeitem_entity_list {

    my $query = query_parameters->get('q');

    $query = '%' . $query . '%';

    my $hdl  = TMS::API::Core::Entity->new();
    my @data = $hdl->ResultSet->search(
        {
            '-or' => [
                { 'business.BizName' => { '-like' => $query } },
                { 'person.FirstName' => { '-like' => $query } },
                { 'person.LastName'  => { '-like' => $query } },
            ]
        },
        {
            prefetch => [ 'business', 'person' ],
            rows     => 10
        }
    )->hashref_array;

    foreach my $entity (@data) {
        if ( defined $$entity{person} ) {
            $$entity{Name} =
              $$entity{person}{FirstName} . ' ' . $$entity{person}{LastName};
        }
        elsif ( defined $$entity{business} ) {
            $$entity{Name} = $$entity{business}{BizName};
        }
    }
    return { DATA => { 'entities' => \@data } };
}

sub chargeitem_children {
    return TMS::API::Feature::TransactionTemplate::children_id(query_parameters->as_hashref);
}

sub chargeitem_list {
    return TMS::API::Feature::TransactionTemplate::list;
}

1;
