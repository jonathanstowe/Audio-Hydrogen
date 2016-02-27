use v6;

use XML::Class;

class Audio::Hydrogen::Pattern does XML::Class[xml-element => 'pattern'] {
    has Str $.name     is xml-element;
    has Str $.category is xml-element = 'not_categorized';
    has Int $.size     is xml-element;

    class Note does XML::Class[xml-element => 'note'] {
        has Int $.position   is xml-element;
        has Int $.lead-lag   is xml-element('leadLag') = 0;
        has Rat $.velocity   is xml-element;
        has Rat $.pan-left   is xml-element('pan_L')   = 0.5;
        has Rat $.pan-right  is xml-element('pan_R')   = 0.5;
        has Int $.pitch      is xml-element            = 0;
        has Str $.note       is xml-element            = 'C';
        has Int $.length     is xml-element;
        has Int $.instrument is xml-element;
        
    }

    has Note @.note-list     is xml-container('noteList');
}
# vim: expandtab shiftwidth=4 ft=perl6
