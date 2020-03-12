get '/api/TestForms' => sub {
    my $list = [];
    find(
        sub {
            return if !-f;
            return if $File::Find::name !~ /public\/modules\/test\/forms\/.*?\.json$/;
            my $file = $File::Find::name;
            $file =~ s/.*\/public\///;
            push @$list, $file;
        },
        abs_path("$FindBin::Bin/../public")
    );
    return $list;
};
