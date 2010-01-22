use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'EBook::FB2',
    AUTHOR              => q{Oleksandr Tymoshenko <gonzo@bluezbox.com>},
    VERSION_FROM        => 'lib/EBook/FB2.pm',
    ABSTRACT_FROM       => 'lib/EBook/FB2.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Carp'              => 0,
        'MIME::Base64'      => 0,
        'Moose'             => 0,
        'Test::More'        => 0,
        'XML::DOM'          => 0,
        'XML::DOM::XPath'   => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'EBook-FB2-*' },
);
