package TMS::API::Feature::Navigation;

use TMS::API::Core::AppMenuItem;
use Data::Dumper;
use File::Basename qw(dirname);
use Cwd qw(realpath getcwd);
use Carp qw(confess longmess);
use TMS::StateBuilder;
use Try::Tiny;

sub regenerate_states {

    # uses StateBuilder to regenerate the state config file for ui-router
    try {
        confess "This has been disabled";
        my $config = {
            rootdir  => getcwd() . '/public/views',
            webdir   => '/views',
            statefn  => 'configstates_compiled.js',
            statedir => getcwd() . '/public/js',
        };
        TMS::StateBuilder::BuildStatesFile($config);
    }
    catch {
        return 500;
    };

    return 200;
}

sub single {
    my $args = shift;
    my $id = $$args{id};
    my $hdl = TMS::API::Core::AppMenuItem->new( Label => undef);

    my $item = undef;
    my $error = undef;
    try {
        print "Requesting AppMenuItem with ID $id \n\n" ;
        $item = $hdl->ResultSet->search({'me.MenuItemId' => $id}, { prefetch => 'parent'})->hashref_first;
        print Dumper($item);

    } catch {
        $error = $_;
    };

    my $reponse = {
        POST        => undef,
        ERROR       => $error,
        DATA        => { item => $item },
        ENVIRONMENT => undef
    };

    return $reponse;
}


sub delete_menu_item {
    my $data = shift;

    # TODO: Get this to delete things properly.
    print Dumper($data);
    my $hdl = TMS::API::Core::AppMenuItem->new( Label => undef );

    try {
        $hdl->Search( { MenuItemId => $$data{MenuItemId} } )->delete();
    }
    catch {
        print "$_";
    };

    print "\n\nHooray! Deleted!\n\n";

    my $reponse = {
        POST        => undef,
        ERROR       => undef,
        DATA        => undef,
        ENVIRONMENT => undef
    };

    return $repsonse;
}

sub query_table {

    # Accounts for pagination
    # used for displaying data in a table
    my $args  = shift;
    my $hdl   = TMS::API::Core::AppMenuItem->new( Label => undef );
    my $query = $$args{query};
    my $page  = $$args{page} || 1;
    my $rows  = $$args{rows} || 10;

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

    my @headers = $hdl->ResultSet->result_source->columns;
    my @data    = $report->hashref_array();

    my $response = {
        POST        => undef,
        ERROR       => undef,
        DATA        => { "list" => \@data, "headers" => \@headers },
        ENVIRONMENT => undef,
    };
    return $response;
}

sub query_options {

    # This doesnt take pagination into account
    # used for returning options for datalist
    my $args  = shift;
    my $hdl   = TMS::API::Core::AppMenuItem->new( Label => undef );
    my $query = $$args{query};
    my $rows  = $$args{rows} || 10;

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
            rows => $rows
        }
    );

    my @data     = $report->hashref_array();
    my $response = {
        POST        => undef,
        ERROR       => undef,
        DATA        => { "options" => \@data },
        ENVIRONMENT => undef,
    };
    return $response;
}

# --------------------------------------------------------------------------------------------------------------------
sub menu_item_all {
    my $hdl = TMS::API::Core::AppMenuItem->new( Label => undef );

    my $report = $hdl->Search(
        { "me.ParentId" => undef },
        {
            prefetch => [
                "app_menu_items",
                {
                    "app_menu_items" => [
                        "parent",
                        {
                            "app_menu_items" => [
                                "parent",
                                {
                                    "app_menu_items" => "parent"
                                }
                            ]
                        }
                    ]
                }
            ],
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
        DATA        => { "list" => \@data },
        ENVIRONMENT => undef,
    };
    return $response;

    #    JSON->new->indent->space_after->space_before->encode($response);
}

# --------------------------------------------------------------------------------------------------------------------
sub menu_item {
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

    my @data     = $report->hashref_array();
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

sub menu_item_manipulate {
    my $args   = shift;
    my $method = $$args{method};
    my $data   = $$args{data};
    print Dumper($data);
    print "\n\n" . ref $data . "\n\n";
    my $reponse = {
        POST        => undef,
        ERROR       => undef,
        DATA        => undef,
        ENVIRONMENT => undef,
    };
    my $hdl = TMS::API::Core::AppMenuItem->new($data);
    my $report;

    try {
        $hdl->$method if defined $hdl->Label;

        $report = $hdl->Search(
            {
                Label => $$data{Label},
            }
        );

        # This is currently disabled because not using UI-Router as component based system instead of purely views.
        # my $config = {
        #     rootdir  => getcwd() . '/public/views',
        #     webdir   => '/views',
        #     statefn  => 'configstates.js',
        #     statedir => getcwd() . '/public/js',
        #     state    => $$data{Route}
        # };

        #TMS::StateBuilder::CreateStateDirFiles($config);
        #TMS::StateBuilder::BuildStatesFile($config);
    }
    catch {
        $$response{ERROR} = $_;
    };

    my @data = defined $report ? $report->hashref_array() : undef;
    $$response{DATA} = { "app_menu_items" => \@data };

    return $response;

}

sub menu_item_update_or_create {
    my $args = shift;
    $$args{method} = 'UpdateOrCreate';
    return menu_item_manipulate($args);
}

sub menu_item_update {
    my $args = shift;
    $$args{method} = 'Update';
    return menu_item_manipulate($args);
}

sub menu_item_create {
    my $args = shift;
    $$args{method} = 'Create';
    return menu_item_manipulate($args);
}

1;
