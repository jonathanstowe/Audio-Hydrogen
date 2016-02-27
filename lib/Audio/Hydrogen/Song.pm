use v6;

use XML::Class;
use Audio::Hydrogen::Pattern;
use Audio::Hydrogen::Instrument;

class Audio::Hydrogen::Song does XML::Class[xml-element => 'song'] {
    sub from-version($v) { $v.Str }
    sub to-version($v)   { Version.new($v) }
    has Version $.version is xml-element is xml-serialise(&from-version) is xml-deserialise(&to-version);
    has Int     $.bpm               is xml-element;
    has Rat     $.volume            is xml-element;
    has Rat     $.metronome-volume  is xml-element('metronomeVolume');
    has Str     $.name              is xml-element;
    has Str     $.author            is xml-element;
    has Str     $.notes             is xml-element;
    has Str     $.license           is xml-element;
    has Bool    $.loop-enabled      is xml-element('loopEnabled');
    has Str     $.mode              is xml-element;
    has Rat     $.humanize-time     is xml-element('humanize_time');
    has Rat     $.humanize-velocity is xml-element('humanize_velocity');
    has Rat     $.swing-factor      is xml-element('swing_factor');
    has Audio::Hydrogen::Instrument @.instruments is xml-container('instrumentList');
    has Audio::Hydrogen::Pattern    @.patterns    is xml-container('patternList');

    class PatternGroup does XML::Class[xml-element => 'group'] {
        has @.pattern-id is xml-element('patterID');
    }

    has PatternGroup @.pattern-sequence is xml-container('patternSequence');

    class Plugin does XML::Class[xml-element => 'fx'] {
        has Str $.name  is xml-element = 'no plugin';
        has Str $.filename is xml-element = '-';
        has Bool $.enabled is xml-element = False;
        has Rat  $.volume  is xml-element = 0.0;
    }

    has Plugin @.plugins is xml-container('ladspa');
}
# vim: expandtab shiftwidth=4 ft=perl6
