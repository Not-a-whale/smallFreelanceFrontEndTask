use Module::Load::Conditional qw(check_install);

find(
    sub {
        return if !-f;
        return if $File::Find::name !~ /\.pm$/;
        require $File::Find::name;
    },
    abs_path("$FindBin::Bin/../lib") . '/TMS/API/Core',
);

my $enum_cache = {};

prefix '/api/options' => sub {
    get '/:table/:column' => sub {
        my $table    = route_parameters->get('table');
        my $column   = route_parameters->get('column');
        my $class    = "TMS::API::Core::$table";
        my $response = {
            DATA  => 'no data',
            POST  => undef,
            ERROR => undef,
        };

        if (check_install(module => $class)) {
            if (!exists $$enum_cache{$class}) {
                $$enum_cache{$class} = {};
            }
            if (!exists $$enum_cache{$class}{$column}) {
                my $obj  = $class->new();
                my $cols = $obj->ColumnsInfo();

                foreach my $key (keys %$cols) {
                    if (exists $$cols{$key}{extra}{list} && $$cols{$key}{extra}{list} != undef) {
                        my @list = @{$$cols{$key}{extra}{list}};

                        #@list = grep { $_ ne '' } @list;
                        $$enum_cache{$class}{$key} = \@list;
                    }
                }
            }

            if (exists $$enum_cache{$class}{$column}) {
                $$response{DATA} = {options => $$enum_cache{$class}{$column}};
                $$response{ERROR} = undef;
            }
        }
        return $response;

    };
};
