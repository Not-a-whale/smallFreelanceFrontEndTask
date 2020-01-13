# ............................................................................
subtype 'TYPENAME',
    as 'Str',
        where {
            my %options = ( OPTIONS );
            return scalar ( grep { not exists $options{$_} } split(/,/, $_)) == 0;
        };

coerce 'TYPENAME',
    from 'Str',
        via {
            if( $AUTO_GENERATE ) {
                my @list = ( LISTS );
                return join(',', rand_set(set => \@list, min => 1, max => scalar(@list), shuffle => 1));
            } else {
                join(',', map{ s/(^\s+|\s+$)//g; s/\s+/ /g; lc($_) } split(',',$_));
            }
        };

coerce 'TYPENAME', from 'HashRef', via {
    my @list   = ( LISTS );
    my %posted = map { lc($_), 1 } keys %$_;
    join(',', grep {defined} map { exists $posted{$_} ? $_ : undef } @list);
};

