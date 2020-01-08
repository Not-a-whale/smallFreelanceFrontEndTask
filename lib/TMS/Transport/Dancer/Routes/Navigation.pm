use TMS::API::Feature::Navigation;
use Carp qw(confess longmess);

prefix '/api' => sub {
    prefix '/navigation' => sub {
        get '/regenerate'   => http_basic_auth required => \&navigation_regenerate;
        prefix '/menu_item' => sub {
            get ''         => http_basic_auth required => \&navigation_single;
            get '/tree'    => http_basic_auth required => \&TMS::API::Feature::Navigation::menu_item_all;
            post '/submit' => http_basic_auth required => \&navigation_menu_item_submit;
            post '/create' => http_basic_auth required => \&navigation_menu_item_create;
            post '/update' => http_basic_auth required => \&navigation_menu_item_update;
            get '/all'     => http_basic_auth required => \&navigation_menu_item_all;
            get '/search'  => http_basic_auth required => \&navigation_search;
            post '/delete' => http_basic_auth required => \&navigation_delete_menu_item;
            get '/table'   => http_basic_auth required => \&navigation_table;
        };
    };
};

sub navigation_single {
    my $id = query_parameters->get('id');

    return TMS::API::Feature::Navigation::single({id => $id});
}

sub navigation_regenerate {
    return TMS::API::Feature::Navigation::regenerate_states();
}

sub navigation_delete_menu_item {
    my $post = body_parameters->get('POST');
    return TMS::API::Feature::Navigation::delete_menu_item($post);
}

sub navigation_table {

    my $args = {
        query => query_parameters->get('q'),
        page  => query_parameters->get('pg'),
        rows  => query_parameters->get('rc'),
    };

    return TMS::API::Feature::Navigation::query_table($args);
} ## end sub navigation_table

sub navigation_search {

    my $args = {
        query => query_parameters->get('q'),
        rows  => query_parameters->get('rc'),
    };

    return TMS::API::Feature::Navigation::query_options($args);
} ## end sub navigation_search

# --------------------------------------------------------------------------------------------------------------------
sub navigation_menu_item_all {
    return TMS::API::Feature::Navigation::menu_item_all();
}

# --------------------------------------------------------------------------------------------------------------------
# this one needs fixes
sub navigation_menu_item_submit {

    # creates or updates menu item, if exists, updates, if doesnt exist, creates new one
    my $args = {data => body_parameters->get('POST')};
    return TMS::API::Feature::Navigation::menu_item_update_or_create($args);
} ## end sub navigation_menu_item_submit

sub navigation_menu_item_create {

    # Strick create new menu item.
    my $args = {data => body_parameters->get('POST')};
    return TMS::API::Feature::Navigation::menu_item_create($args);
} ## end sub navigation_menu_item_create

sub navigation_menu_item_update {

    # strick update existing menu item.
    my $args = {data => body_parameters->get('POST')};
    return TMS::API::Feature::Navigation::menu_item_update($args);
} ## end sub navigation_menu_item_update
1;
