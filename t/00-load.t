#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'EBook::FB2' ) || print "Bail out!
";
}

diag( "Testing EBook::FB2 $EBook::FB2::VERSION, Perl $], $^X" );
