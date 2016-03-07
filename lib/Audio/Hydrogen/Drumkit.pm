use v6.c;

use XML::Class;

use Audio::Hydrogen::Instrument;

class Audio::Hydrogen::Drumkit does XML::Class[xml-element => 'drumkit_info'] {
   has Str                         $.name        is xml-element;
   has Str                         $.author      is xml-element;
   has Str                         $.info        is xml-element;
   has Audio::Hydrogen::Instrument @.instruments is xml-container('instrumentList');

   method make-absolute(IO::Path $path) {
       for @!instruments -> $instrument {
           $instrument.make-absolute($path);
       }
   }
}


# vim: expandtab shiftwidth=4 ft=perl6
