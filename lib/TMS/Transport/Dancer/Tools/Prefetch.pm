use Carp;
use Tie::IxHash;
use Data::Dumper;
use Perl::Tidy;

my %DBIxInfo = ();
tie %DBIxInfo, 'Tie::IxHash';
my @DBIxSrcs         = ();
my $FeatureTemplates = {};

get '/prefetch' => sub {
    session pid => $$;
    send_as 'html' => send_file '/prefetch/prefetch.html';
};

{
    my $JSON = JSON->new->utf8->allow_nonref->indent->space_after->space_before;
    my $DBIx = TMS::Schema->new()->DBIxHandle;
    @DBIxSrcs = sort $DBIx->sources;

    my $TemplateBase = abs_path("$FindBin::Bin/../tools/templates");
    my $FeaturesBase = abs_path("$FindBin::Bin/../lib/TMS/API/Feature");
    my $RoutesBase   = abs_path("$FindBin::Bin/../lib/TMS/Transport/Dancer/Routes");

    foreach my $tag (qw( FeatureClass DancerRoute )) {
        my $filename = "$TemplateBase/$tag.pm";
        if (-f "$filename") {
            local $/ = undef;
            open(FI, "<$filename");
            $$FeatureTemplates{$tag} = <FI>;
            close(FI);
        }
    }

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

        confess "Missing FeatureName" unless defined $$PostData{Feature} && $$PostData{Feature} =~ /\S+/;
        $$PostData{Feature} =~ s/\s+//g;

        confess "Missing Route" unless defined $$PostData{Route} && $$PostData{Route} =~ /\S+/;
        $$PostData{Route} =~ s/\s+//g;

        my $CoreAPI          = $$PostData{TopLevel};
        my $CoreDependences  = [$CoreAPI];
        my $PrefetchRcrd     = PrefetchLoop($$PostData{Selected}, $CoreDependences);
        my $FeatureTemplate  = $$FeatureTemplates{FeatureClass};
        my $RouteTemplate    = $$FeatureTemplates{DancerRoute};
        my $FeatureClassName = $$PostData{Feature};
        my $FeatureClassFile = "$FeaturesBase/$FeatureClassName.pm";
        my $FeatureRoute     = $$PostData{Route};
        my $PrefetchText     = Dumper($PrefetchRcrd);
        my $FeatureClassData = undef;
        my %DependencesList  = map { $_, 1 } @$CoreDependences;
        my $DependencyText   = join("\n", map {"use TMS::API::Core::$_;"} sort keys %DependencesList);
        my $JsonSample       = SampleJson($$PostData{Selected});

        $FeatureClassName =~ s/\//::/g;

        $FeatureTemplate =~ s/FEATURECLASSNAME/$FeatureClassName/s;
        $FeatureTemplate =~ s/FEATUREPATH/$FeatureClassFile/s;
        $FeatureTemplate =~ s/COREAPINAME/$CoreAPI/s;
        $FeatureTemplate =~ s/PREFETCHDATA/$PrefetchText/s;
        $FeatureTemplate =~ s/DEPENDENCIES/$DependencyText/s;

        $RouteTemplate =~ s/FEATURECLASSNAME/$FeatureClassName/gs;
        $RouteTemplate =~ s/THEROUTE/$FeatureRoute/s;

        my $argv = "-npro";    # Ignore any .perltidyrc at this site
        $argv .= " -pbp";      # Format according to perl best practices
        $argv .= " -nst";      # Must turn off -st in case -pbp is specified
        $argv .= " -se";       # -se appends the errorfile to stderr

        Perl::Tidy::perltidy(argv => $argv, source => \$FeatureTemplate, destination => \$FeatureClassData);

        print STDERR "-" x 80 . "\n";
        print STDERR $FeatureClassData;
        print STDERR "-" x 80 . "\n";
        print STDERR $RouteTemplate;
        print STDERR "-" x 80 . "\n";

        my $dir = $FeatureClassFile;
        $dir =~ s/\/[^\/]+$//;
        print STDERR `mkdir -p "$dir" 2>&1` if !-d "$dir";
        if (-d "$dir") {
            my $FileBase = "$FeaturesBase/$FeatureClassName";
            open(FP, ">$FileBase.posted.json") || exit;
            print FP $JSON->encode($PostData);
            close(FP);

            open(FS, ">$FileBase.sample.json") || exit;
            print FS $JSON->encode($JsonSample);
            close(FS);

            open(FO, ">$FeatureClassFile") || exit;
            print FO $FeatureClassData;
            close(FO);

            my $Name = $FeatureRoute;
            $Name =~ s/\//_/g;

            my $file = "$RoutesBase/$Name.pm";
            open(FR, ">$file") || exit;
            print FR $RouteTemplate;
            close(FR);
        }

        return {FeatureAPI => $FeatureClassFile};
    };
}

sub SampleJson {
    my ($tree, $json) = @_;
    return undef if ref($tree) ne 'HASH';
    return undef if !exists $$tree{columns};

    if (!defined $json) {
        $json = {};
        tie %$json, 'Tie::IxHash';
    }
    $$json{$$_{name}} = $$_{data_type} foreach @{$$tree{columns}};

    return undef if !exists $$tree{'related'};
    foreach my $type (qw(belongsto hasmany)) {
        if (exists $$tree{'related'}{$type}) {
            foreach my $rec (@{$$tree{'related'}{$type}}) {
                next if !$$rec{checked};
                my $subset = {};
                tie %$subset, 'Tie::IxHash';

                if ($type eq 'hasmany') {
                    push @{$$json{$$rec{relationship}}}, $subset;
                    __SUB__->($$rec{subset}, $$json{$$rec{relationship}}[0]);
                } else {
                    $$json{$$rec{relationship}} = $subset;
                    __SUB__->($$rec{subset}, $$json{$$rec{relationship}});
                }
            }
        }
    }
    return $json;
}

sub PrefetchLoop {
    my ($tree, $dependency) = @_;
    return undef if ref($tree) ne 'HASH';
    return undef if !exists $$tree{'related'};

    my $prefetch = undef;
    foreach my $type (qw(belongsto hasmany)) {
        next if !exists $$tree{'related'}{$type};
        foreach my $rec (@{$$tree{'related'}{$type}}) {
            next if !$$rec{checked};
            push @$dependency, $$rec{source};
            my $subset = undef;
            if (exists $$rec{subset} && defined $$rec{subset} && ref($$rec{subset}) eq 'HASH') {
                $subset = __SUB__->($$rec{subset}, $dependency);
            }
            push @$prefetch, defined $subset ? {$$rec{relationship} => $subset} : $$rec{relationship};
        }
    }
    return $prefetch;
}
