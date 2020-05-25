use Tie::IxHash;
use File::Temp qw/ tempfile /;

get '/prefetch' => sub { send_as 'html' => send_file '/prefetch/prefetch.html' };

my $JSON = JSON->new->utf8->pretty;
{
    my %DBIxInfo = ();
    tie %DBIxInfo, 'Tie::IxHash';
    my @DBIxSrcs         = ();
    my $FeatureTemplates = {};

    my $DBIx = TMS::Schema->new()->DBIxHandle;
    @DBIxSrcs = sort $DBIx->sources;

    my $TemplateBase = abs_path("$FindBin::Bin/../tools/templates");
    my $FeaturesBase = abs_path("$FindBin::Bin/../lib/TMS/API/Feature");
    my $RoutesBase   = abs_path("$FindBin::Bin/../lib/TMS/Transport/Dancer/Routes");
    my $FormsBase    = abs_path("$FindBin::Bin/../public/modules/test/forms");

    foreach my $src (@DBIxSrcs) {
        my $rset = $DBIx->resultset($src);
        my $rsrc = $rset->result_source;
        my %pkey = map { $_, 1 } $rsrc->primary_columns;
        my %info = ();

        tie %info, 'Tie::IxHash';
        $info{resource} = {
            name  => $src,
            table => $rsrc->name,
        };

        foreach my $clname ($rsrc->columns) {
            my $clref = $rsrc->column_info($clname);
            tie my %clinfo, 'Tie::IxHash', (name => $clname);
            $clinfo{$_} = $$clref{$_} foreach sort keys %$clref;
            $clinfo{is_primary} = 1 if exists $pkey{$clname};
            push @{$info{columns}}, \%clinfo;
        }

        foreach my $rl (sort $rsrc->relationships) {
            my $data  = $rsrc->relationship_info($rl);
            my $type  = $$data{attrs}{is_depends_on} ? 'belongsto' : 'hasmany';
            my $class = $$data{source};
            $$data{source} =~ s/.*:://gs;

            tie my %details, 'Tie::IxHash',
                (
                relationship => $rl,
                source       => $$data{source},
                accessor     => $$data{attrs}{accessor},
                checked      => 0,
                );
            push @{$info{related}{$type}}, \%details;
        }
        $DBIxInfo{$src} = \%info;
        get "/prefetch/$src" => sub { $DBIxInfo{$src} };
    }

    get '/prefetch/sources'          => sub { \@DBIxSrcs };
    post '/prefetch/post_selections' => sub {
        my $PostData = body_parameters->mixed;
        my $Utility  = abs_path("$FindBin::Bin/../lib/TMS/Transport/Dancer/Tools/Prefetch.pl");
        my $TempFile = File::Temp->new(UNLINK => 0, SUFFIX => '.prefetch.post.json');
        my $FileName = $TempFile->filename;
        my $Record   = {
            PostedData   => $PostData,
            TemplateBase => $TemplateBase,
            FeaturesBase => $FeaturesBase,
            RoutesBase   => $RoutesBase,
            FormsBase    => $FormsBase,
        };
        my $JsonData = $JSON->encode($Record);
        print $TempFile "$JsonData";
        system('nohup',$Utility, $FileName);
        return {FileName => $FileName};
    };
}
