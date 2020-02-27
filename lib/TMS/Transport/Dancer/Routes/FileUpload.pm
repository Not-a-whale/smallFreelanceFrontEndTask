use Data::Dumper;
use MIME::Base64 qw(decode_base64 encode_base64);
use Try::Tiny;
prefix '/api' => sub {
    prefix '/upload' => sub {
        post '/file' => \&upload_the_xml_file;
    };
};

sub upload_the_xml_file {
  # this is with the Mutable serializer with mapping multipart/ -> XML
  my $file = request->upload('file');
  try {
    print 'temp/' . $file->basename . "\n";
    print 'filesize: ' . $file->size . "\n";
    print 'content-type: ' . $file->type . "\n";

    $file->copy_to('temp/' . $file->basename) || die 'Failed to save file on server.';
  } catch {
    print $_;
    return {status => 500, message => $_};
  };

  return 200;
}

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
