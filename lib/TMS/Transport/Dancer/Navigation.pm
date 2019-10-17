use TMS::API::Feature::Navigation;
use Carp qw(confess longmess);

prefix '/api' => sub {
    prefix '/navigation' => sub {
        get '/regenerate'   => \&navigation_regenerate;
        prefix '/menu_item' => sub {
            get '' => \&navigation_single;
            get '/tree' => \&TMS::API::Feature::Navigation::menu_item_all;
            post '/submit'    => \&navigation_menu_item_submit;
            post '/create' => \&navigation_menu_item_create;
            post '/update' => \&navigation_menu_item_update;
            get '/all'     => \&navigation_menu_item_all;
            get '/search'  => \&navigation_search;
            post '/delete' => \&navigation_delete_menu_item;
            get '/table'   => \&navigation_table;
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
}

sub navigation_search {

    my $args = {
        query => query_parameters->get('q'),
        rows  => query_parameters->get('rc'),
    };

    return TMS::API::Feature::Navigation::query_options($args);
}

# --------------------------------------------------------------------------------------------------------------------
sub navigation_menu_item_all {
    return TMS::API::Feature::Navigation::menu_item_all();
}

# --------------------------------------------------------------------------------------------------------------------
# this one needs fixes
sub navigation_menu_item_submit {

# creates or updates menu item, if exists, updates, if doesnt exist, creates new one
    my $args = { data => body_parameters->get('POST') };
    return TMS::API::Feature::Navigation::menu_item_update_or_create($args);
}

sub navigation_menu_item_create {

    # Strick create new menu item.
    my $args = { data => body_parameters->get('POST') };
    return TMS::API::Feature::Navigation::menu_item_create($args);
}

sub navigation_menu_item_update {

    # strick update existing menu item.
    my $args = { data => body_parameters->get('POST') };
    return TMS::API::Feature::Navigation::menu_item_update($args);
}
1;
