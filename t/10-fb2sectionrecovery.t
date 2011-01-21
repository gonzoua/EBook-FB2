#!perl -T

use Test::More tests => 2;
use EBook::FB2;
use File::Temp qw/ tempfile /;



my $data = <<__EOXML__;
<FictionBook>
    <description>
      <title-info></title-info>
      <document-info>
          <date></date>
          <id></id>
      </document-info>
    </description>
    <body><b>1</b><section>1</section>test</body>
</FictionBook>

__EOXML__


my ($fh, $filename) = tempfile();
print $fh $data;
close $fh;
my $fb2 = EBook::FB2->new;
$fb2->load($filename);
unlink $filename;

is($fb2->bodies, 1);
is(($fb2->bodies)[0]->sections, 3);
