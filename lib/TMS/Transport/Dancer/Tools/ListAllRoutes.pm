get '/api/routes' => sub {
    my $app = app();

    my %get  = map { $_, 1 } CleanRgxRoutes($app->routes_regexps_for('get'));
    my %post = map { $_, 1 } CleanRgxRoutes($app->routes_regexps_for('post'));
    my %all  = map { $_, 1 } keys %get, keys %post;
    my $count = 0;
    my $out   = <<~EOH;
    <style type="text/css">
    table,td {
            border-collapse: collapse;
            border: 1px solid #000000;
    }
    td { padding: 5px;
    </style>
    EOH

    foreach (sort keys %all) {
        $out .= '<tr>';

        $out .= sprintf '<td>%d</td>', ++$count;
        $out .= sprintf '<td>%s</td>', exists $get{$_} ? 'GET' : '';
        $out .= sprintf '<td>%s</td>', exists $post{$_} ? 'POST' : '';
        $out .= sprintf '<td>%s</td>', exists $get{$_} ? "<a href='$_' target='_blank'>$_</a>" : $_;

        $out .= '</tr>';
    }
    send_as 'html' => "<table>$out</table>";
};

sub CleanRgxRoutes {
    my $ref = shift;
    my @lst = ();
    foreach (sort @$ref) {
        s/\^//g;
        s/\\//g;
        s/\$//g;
        push @lst, $_;
    }
    return @lst;
}
