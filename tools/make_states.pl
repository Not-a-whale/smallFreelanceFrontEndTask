#!/usr/bin/perl
# $Id: $

BEGIN {
    unshift @INC,
      './lib';    #having to do this is kind of annoying and reduces portability
}

use strict;
use warnings FATAL => 'all';
use Carp qw(confess longmess);
use Data::Dumper;
use Cwd qw(realpath);
use File::Basename qw(dirname);
use JSON;
use TMS::StateBuilder;

# my $rules = {
#     dryrun => {
#         isa     => 'Bool',
#         alias   => 'd',
#         comment => 'Dry run, prints every command that will be executed',
#         default => 0
#     },
#     basedir => {
#         isa   => 'Str',
#         alias => 'b',
#         comment =>
# 'The directory to traverse, dirs -> statenames, .html -> view template'
#     },
#     statefn => {
#         isa     => 'Str',
#         alias   => 'n',
#         comment => 'The filename of the state config',
#         default => 'configstates.js'
#     },
#     statedir => {
#         isa   => 'Str',
#         alias => 's',
#         comment =>
#           'Where to place the state config file, overwrites existing file'
#     },
# };

# my $CLI = ProcessCLI( rules => $rules, isfatal => 1 );

# sub GenerateString {
#     my $minlength = shift;
#     my $variance  = shift;
#     my @chars     = ( 'a' .. 'z', 'A' .. 'Z', '0' .. '9' );
#     my $length    = int( rand(1) * $variance + $minlength );
#     return
#       join( '', map { $chars[ int( rand() * scalar @chars ) ] } 0 .. $length );
# }

my $rootdir = realpath( dirname( realpath($0) ) . '/../public' );
my $basedir = "views";

my $config_filename = "configstates_compiled.js";
my $confdir         = "/views";

my $config = {
    #dry      => undef,
    rootdir  => "$rootdir/$basedir",
    webdir   => $basedir,
    statefn  => $config_filename,
    statedir => "$rootdir$confdir",
    #state => "tmsapp.main.tomato.dragon.fork.stick",
};

TMS::StateBuilder::BuildStatesFile($config);
TMS::StateBuilder::CreateStateDirFiles($config);

# my @dirs = ("");
# my %views;    # quick reference to view => states

# my %states;   # holds the states that will later be JSONified
# my %state_to_path;

# my @dependency;

# -d $rootdir || confess "Have to run from root directory of app.";
# my $pwd;
# do {
#     $pwd = shift @dirs;

#     # extract all dirs and files from current directory
#     my $opendir = "$rootdir$basedir$pwd";
#     opendir( DIR, $opendir ) || confess "Cannot open directory $opendir";
#     my @files = readdir(DIR);
#     closedir(DIR);

#     foreach my $file (@files) {

#         # skip parent and current dirs
#         next if $file =~ /^\.\.?$/;

#         my $path = "$opendir/$file";

#         #generate the state that will be used in angularjs

#         my $state;
#         $state = $pwd if -f $path;    # files are used to link views
#         $state = "$pwd/$file"
#           if -d $path;                # directories are used for state names
#         $state =~ s/^\///;            # remove the first leading backslash
#         $state =~ s/\//./g;           # states use . to describe hierarchy

#         if ( -d $path ) {

#             # already visted the state so skip it
#             next if exists $states{$state};

#             # this will include the "empty non-named state needed for angularjs"
#             # the state has to be skipped when building the JSON and JS files
#             $states{$state} = {};
#             #$states{$state}{"url"} = '/' . GenerateString( 4, 6 );
#             $states{$state}{"url"} = "/$file";

#             # map state to path for simplicity
#             $state_to_path{$state} = $path;

#             push @dirs, "$pwd/$file";
#             next;
#         }

#         next if ( $file !~ /(.*)\.html$/i );   # only looking for template files

#         # check the name of the files
#         # template => then this is the template of the current state ui-view
#         # all other named files belong to named views
#         my $view = $1;

#         # find all the ui-view in the file if its named, then store it
#         open( my $fh, "<", $path ) || confess "Cannot open file $path";
#         {
#             local $/;
#             my $content = <$fh>;
#             foreach ( $content =~ /ui-view="([^"]+?)"/g ) {
#                 $views{$_} = $state;
#             }
#         }
#         close($fh);
#         next if $state !~ /\w+/;
#         my $web_path = "$basedir$pwd/$file";
#         if ( $view =~ 'template' ) {
#             $states{$state}{"templateUrl"} = $web_path;
#         }
#         else {
#             if ( exists $views{$view} ) {
#                 my $parent = $views{$view};
#                 $states{$state}{views}{ $view . '@' . $parent }{"templateUrl"}
#                   = $web_path;
#             }
#             else {
#                 push @dependency, [ $pwd, $file ];
#             }
#         }
#     }
# } while ( scalar @dirs );

# # these are all the files that were not able to be linked to states
# # try to link again
# foreach (@dependency) {
#     my $pwd  = @$_[0];
#     my $file = @$_[1];

#     $file =~ /(.*)\.html$/i;
#     my $view = $1;

#     print "$view\n";

#     my $web_path = "$basedir$pwd/$file";

#     my $state = $pwd;
#     $state =~ s/^\///;     # remove the first leading backslash
#     $state =~ s/\//./g;    # states use . to describe hierarchy

#     if ( exists $views{$view} ) {
#         my $parent = $views{$view};
#         $states{$state}{views}{ $view . '@' . $parent }{"templateUrl"} =
#           $web_path;
#     }
#     else {
#         confess "Dependency view not found for $basedir$pwd/$file";
#     }
# }

# print Dumper( \%views );
# #print Dumper( \%states );
# #print Dumper( \@dependency );
# print Dumper ( keys %states );
# print Dumper( \%state_to_path );

# if ( scalar @dependency ) {
#     confess "Could not build file because view dependency not satisfied"
#       . Dumper( \@dependency );
# }

# my $json = JSON->new->allow_nonref->indent->canonical([1]);

# open( my $fh, ">", "$rootdir$confdir/$config_filename" )
#   || confess "Could not open file to write configstates";

# print $fh 'var configstates = ' . $json->encode( \%states );
# close($fh);

# foreach my $state (sort keys %states ) {
#     next if $state !~ /\w+/;
#     my $filename = $state_to_path{$state} . '/state.json';
#     open( my $fh, ">", $filename );
#     print $fh $json->encode( { $state => $states{$state} } );
#     close($fh);
# }
