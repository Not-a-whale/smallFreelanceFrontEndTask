#! /usr/local/bin/perl

# this is the command that should be run for each file, margins should be removed.
# wkhtmltopdf --margin-top 0 --margin-bottom 0 --margin-right 0 --margin-left 0 --page-size letter --print-media-type cheque.html --disable-smart-shrinking cheque_unix.pdf
use strict;
use warnings;
use PDF::WebKit;
use Cwd;
use Data::Dumper;

my $dir = getcwd;

my @filenames = ( 'invoice', 'settlement', 'cheque' );
my @cssfiles = ( ['invoice.css','page.css'], ['settlement.css','page.css'], ['cheque.css', 'settlement.css','page.css']);

# this module calls wkhtmltopdf as is, so must be on path, otherwise it fails.
# all this module really does is create a fancy way to call the wkhtmltopdf... -__-
#$ENV{'PATH'} = 'C:/Program Files/wkhtmltopdf/bin;' . $ENV{'PATH'};
my %options = (
    '--page-size'               => 'Letter',
    '--margin-top'              => '0.0in',
    '--margin-bottom'           => '0.0in',
    '--margin-right'            => '0.0in',
    '--margin-left'             => '0.0in',
    '--disable-smart-shrinking' => 'yes',
);

foreach my $filename (@filenames) {

    my $pdf_name  = $filename . '.pdf';
    my $html_name = $filename . '.html';

    print "Opening file: $filename\n";
    die $! unless open( FIN, '<' . $html_name );
    my $html;
    {
        local $/;
        $html = <FIN>;
    }

    my $css_files = shift @cssfiles;
    print Dumper($css_files);

    my $kit = PDF::WebKit->new( \$html, %options );
    push @{ $kit->stylesheets }, @{$css_files};

    if ( -f $pdf_name ) {
        die $! unless unlink $pdf_name;
    }

 # for some reason webkit needs to have the file created before writing to it...
    open my $temp, '>', $pdf_name;
    close $temp;

    my $pdf = $kit->to_file($pdf_name);

    close(FIN);

}
