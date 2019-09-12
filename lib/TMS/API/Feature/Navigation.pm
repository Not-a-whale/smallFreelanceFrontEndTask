use TMS::API::Core::AppMenuItem;
use Data::Dumper;

prefix '/api' => sub {
    prefix '/navigation' => sub {
        prefix '/menu_item' => sub {
            post '/add'    => \&navigation_menu_item_add;
            get ''         => \&navigation_menu_item;
            get '/all'     => \&navigation_menu_item_all;
            get '/search'  => \&navigation_search;
            del ''         => \&navigation_delete_menu_item;
            get '/parents' => \&navigation_parents_options_all;
            get '/table'   => \&navigation_table;
        };
    };
};

sub navigation_parents_options_all {
    my $hdl = TMS::API::Core::AppMenuItem->new( Label => undef );
    my $report = $hdl->Search(
        {},
        {
            order_by => {
                '-asc' => [ 'me.SortIndex', 'me.Label' ]
            }
        }
    );

    my @data = $report->hashref_array();

    my @options = map { { key => $$_{Label}, val => $_ } } @data;
    my $response = {
        POST        => undef,
        ERROR       => undef,
        DATA        => { "options" => \@options },
        ENVIRONMENT => undef,
    };
    return $response;

}

sub navigation_delete_menu_item {

    # TODO: Get this to delete things properly.
    my $hdl = TMS::API::Core::AppMenuItem->new( Label => undef );

    print "\n\nHooray! Deleted!\n\n";

    my $reponse = {
        POST        => undef,
        ERROR       => undef,
        DATA        => undef,
        ENVIRONMENT => undef
    };

    return $repsonse;
}

sub navigation_table {
    my $hdl = TMS::API::Core::AppMenuItem->new( Label => undef );
    my $query = query_parameters->get('q');
    my $page = query_parameters->get('pg') || 1;
    my $rows = query_parameters->get('rc') || 3;

    $query = '%' . $query . '%';
    print "\n\n\n $query \n\n\n";
    my $report = $hdl->Search(
        {
            '-or' => [
                Label => { -like => $query },
                Title => { -like => $query }
            ]
        },
        {
            order_by => {
                '-asc' => [ 'me.Label', 'me.Title' ]
            },
            page => $page,
            rows => $rows
        }
    );

    my @headers = $hdl->ResultSet->result_source->columns;
    print Dumper(\@headers);

    my @data = $report->hashref_array();

    my $response = {
        POST        => undef,
        ERROR       => undef,
        DATA        => { "list" => \@data , "headers" => \@headers},
        ENVIRONMENT => undef,
    };
    return $response;
}

sub navigation_search {
    my $hdl = TMS::API::Core::AppMenuItem->new( Label => undef );
    my $query = query_parameters->get('q');
    my $page = query_parameters->get('pg') || 1;
    my $rows = query_parameters->get('rc') || 3;

    $query = '%' . $query . '%';
    my $report = $hdl->Search(
        {
            '-or' => [
                Label => { -like => $query },
                Title => { -like => $query }
            ]
        },
        {
            order_by => {
                '-asc' => [ 'me.Label', 'me.Title' ]
            },
            page => $page,
            rows => $rows
        }
    );


    my @data = $report->hashref_array();

    my @options = map { { key => $$_{Label}, val => $_ } } @data;

    my $response = {
        POST        => undef,
        ERROR       => undef,
        DATA        => { "options" => \@options },
        ENVIRONMENT => undef,
    };
    return $response;
}

# --------------------------------------------------------------------------------------------------------------------
sub navigation_menu_item_all {
    my $hdl = TMS::API::Core::AppMenuItem->new( Label => undef );

    my $report = $hdl->Search(
        { "me.ParentId" => undef },
        {
            prefetch => [ "app_menu_items", { "app_menu_items" => "parent" } ],
            order_by => {
                '-asc' => [
                    'me.SortIndex',             'me.Label',
                    'app_menu_items.SortIndex', 'app_menu_items.Label'
                ]
            }
        }
    );

    my @data = $report->hashref_array();

    my $response = {
        POST        => undef,
        ERROR       => undef,
        DATA        => { "app_menu_items" => \@data },
        ENVIRONMENT => undef,
    };
    return $response;

    #    JSON->new->indent->space_after->space_before->encode($response);
}

# --------------------------------------------------------------------------------------------------------------------
sub navigation_menu_item {
    my $hdl = TMS::API::Core::AppMenuItem->new( Label => undef );

    my $report = $hdl->Search(
        {
            '-and' => [
                "me.Enabled"  => "1",
                "me.ParentId" => undef,
                '-or'         => [
                    "app_menu_items.Enabled" => "1",
                    "app_menu_items.Enabled" => \"IS NULL"
                ]
            ]
        },
        {
            prefetch => "app_menu_items",
            order_by => {
                '-asc' => [
                    'me.SortIndex',             'me.Label',
                    'app_menu_items.SortIndex', 'app_menu_items.Label'
                ]
            }
        }
    );

    my @data = $report->hashref_array();
    my $response = {
        POST        => undef,
        ERROR       => undef,
        DATA        => { "app_menu_items" => \@data },
        ENVIRONMENT => undef,
    };

    return $response;
}

# --------------------------------------------------------------------------------------------------------------------
# this one needs fixes
sub navigation_menu_item_add {
    my $params = body_parameters->as_hashref;
    my $data   = $$params{POST};
    print Dumper($data);
    my $hdl = TMS::API::Core::AppMenuItem->new($data);
    my $report;

    try {
        $hdl->UpdateOrCreate if defined $hdl->Label;
    }
    catch {
        print $_;
    };

    $report = $hdl->Search(
        {
            '-and' => [
                "me.Enabled"  => "1",
                "me.ParentId" => \"IS NULL",
                '-or'         => [
                    "app_menu_items.Enabled" => "1",
                    "app_menu_items.Enabled" => \"IS NULL"
                ]
            ]
        },
        {
            prefetch => {"app_menu_items"},
            order_by => { '-asc' => [ 'me.Label', 'app_menu_items.Label' ] }
        }
    );

    my @data = $report->hashref_array();

    return { "app_menu_items" => \@data };
}

1;
