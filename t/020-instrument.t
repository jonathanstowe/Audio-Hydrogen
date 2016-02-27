#!perl6

use v6;

use Test;

use Audio::Hydrogen::Drumkit;

my $data-dir = $*PROGRAM.parent.child('data');

my $xml = $data-dir.child('drumkit.xml').slurp;

my $obj;
lives-ok {
    $obj = Audio::Hydrogen::Drumkit.from-xml($xml);
}, "from-xml";





done-testing;
# vim: expandtab shiftwidth=4 ft=perl6
