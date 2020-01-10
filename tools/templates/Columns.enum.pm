# ............................................................................
subtype 'TYPENAME',
    as 'Str',
        where {
            my %options = ( OPTIONS );
            return exists $options{$_};
        };

coerce 'TYPENAME',
    from 'Str',
        via {
            if( $AUTO_GENERATE ) {
                my @list = ( LISTS );
                return rand_enum(set => \@list);
            } else {
                s/(^\s+|\s+$)//g;
                s/\s+/ /g;
                return( lc($_) );
            }
        };
