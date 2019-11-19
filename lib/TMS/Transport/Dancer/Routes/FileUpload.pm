use Data::Dumper;
use MIME::Base64 qw(decode_base64 encode_base64);
use Try::Tiny;
prefix '/api' => sub {
    prefix '/upload' => sub {
        post '/file' => \&upload_the_file_please;
    };
};

sub upload_the_file_please {

    my $file        = body_parameters->get('file');
    my $filecontent = $$file{content};
    $filecontent =~ s/.*?base64,//;
    $binarycontent = decode_base64($filecontent);

    my $savepath = "temp/" . $$file{name};

    try {
        open my $fh, '>:raw', $savepath
          or die "\n\n ERROR: Couldnt open file: " . $$file{name} . "\n\n";
        print $fh $binarycontent;
        close $fh;
    }
    catch {
      print $_;
      return { status => 500 };
    };

    return { status => 200 };

}
