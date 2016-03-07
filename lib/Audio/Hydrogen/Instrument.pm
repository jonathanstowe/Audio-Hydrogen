use v6.c;

use XML::Class;

class Audio::Hydrogen::Instrument does XML::Class[xml-element => 'instrument'] {
    has Int  $.id                  is xml-element;
    has Str  $.name                is xml-element;
    has Str  $.filename            is xml-element;
    has Rat  $.volume              is xml-element;
    has Bool $.is-muted            is xml-element('isMuted') = False;
    has Bool $.is-locked           is xml-element('isLocked') = False;
    has Rat  $.pan-left            is xml-element('pan_L') = 1.0;
    has Rat  $.pan-right           is xml-element('pan_R') = 1.0;
    has Rat  $.random-pitch-factor is xml-element('randomPitchFactor') = 0.0;
    has Int  $.gain                is xml-element = 1;
    has Bool $.filter-active       is xml-element('filterActive') = False;
    has Rat  $.filter-cutoff       is xml-element('filterCutoff');
    has Rat  $.filter-resonance    is xml-element('filterResonance');
    has Int  $.attack              is xml-element('Attack') = 0;
    has Int  $.decay               is xml-element('Decay')  = 0;
    has Int  $.sustain             is xml-element('Sustain') = 1;
    has Int  $.release             is xml-element('Release') = 1000;
    has      $.exclude             is xml-element;

    class Layer does XML::Class[xml-element => 'layer'] {
        has Str $.filename is rw is xml-element;
        has Rat $.min      is xml-element;
        has Rat $.max      is xml-element;
        has Int $.gain     is xml-element;
        has Int $.pitch    is xml-element = 0;
    }

    has Layer @.layer;

    method make-absolute(IO::Path $path) {
        if $!filename && !$!filename.IO.is-absolute {
            $!filename = $path.child($!filename).Str;
        }
        for @!layer ->  $layer {
            if !$layer.filename.IO.is-absolute {
                my $new-path = $path.child($layer.filename).Str;
                $layer.filename = $new-path;
            }
        }
    }
}


# vim: expandtab shiftwidth=4 ft=perl6
