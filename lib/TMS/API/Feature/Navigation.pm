use TMS::API::Core::AppMenuItem;

prefix '/api' => sub {
    prefix '/navigation' => sub {
        prefix '/menu_item' => sub {
            post '/add' => \&navigation_menu_item_add;
            get ''      => \&navigation_menu_item;
            get '/all'  => \&navigation_menu_item_all;
        };
    };
};

# --------------------------------------------------------------------------------------------------------------------
sub navigation_menu_item_all {
    my $hdl = TMS::API::Core::AppMenuItem->new(Label => undef);

    my $report = $hdl->Search(
        {"me.ParentId" => undef},
        {   prefetch => {"app_menu_items" => "app_menu_actions"},
            order_by => {'-asc'           => ['me.SortIndex', 'me.Label', 'app_menu_items.SortIndex', 'app_menu_items.Label']}
        }
    );

    my $response = {
        POST        => undef,
        ERROR       => undef,
        DATA        => {"app_menu_items" => $report},
        ENVIRONMENT => undef,
    };
    return $response;

    #    JSON->new->indent->space_after->space_before->encode($response);
}

# --------------------------------------------------------------------------------------------------------------------
sub navigation_menu_item {
    my $hdl = TMS::API::Core::AppMenuItem->new(Label => undef);

    my $report = $hdl->Search(
        {   '-and' => [
                "me.Enabled"  => "1",
                "me.ParentId" => undef,
                '-or'         => [
                    "app_menu_items.Enabled" => "1",
                    "app_menu_items.Enabled" => \"IS NULL"
                ]
            ]
        },
        {   prefetch => {"app_menu_items" => "app_menu_actions"},
            order_by => {'-asc'           => ['me.SortIndex', 'me.Label', 'app_menu_items.SortIndex', 'app_menu_items.Label']}
        }
    );

    my $response = {
        POST        => undef,
        ERROR       => undef,
        DATA        => {"app_menu_items" => $report},
        ENVIRONMENT => undef,
    };

    return $response;
}

# --------------------------------------------------------------------------------------------------------------------
# this one needs fixes
sub navigation_menu_item_add {
    my $params = body_parameters->as_hashref;
    my $data   = $$params{POST};

    my $hdl = TMS::API::Core::AppMenuItem->new($data);
    my $report;

    try {
        $hdl->UpdateOrCreate if defined $hdl->Label;
    } catch {

    };

    $report = $hdl->Search(
        {   '-and' => [
                "me.Enabled"  => "1",
                "me.ParentId" => \"IS NULL",
                '-or'         => [
                    "app_menu_items.Enabled" => "1",
                    "app_menu_items.Enabled" => \"IS NULL"
                ]
            ]
        },
        {prefetch => {"app_menu_items" => "app_menu_actions"}, order_by => {'-asc' => ['me.Label', 'app_menu_items.Label']}}
    );
    return {"app_menu_items" => $report};
}

1;
