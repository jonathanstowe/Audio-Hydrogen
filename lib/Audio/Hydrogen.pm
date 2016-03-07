use v6;

use Audio::Hydrogen::Drumkit;
use Audio::Hydrogen::Song;
class Audio::Hydrogen {

    class DrumkitInfo {
        has Str $.name;
        has IO::Path $.path;

        method drumkit() returns Audio::Hydrogen::Drumkit {
            my $xml = $!path.child('drumkit.xml').slurp;
            my $dk = Audio::Hydrogen::Drumkit.from-xml($xml);
            $dk.make-absolute($!path);
            $dk;
        }
    }

    has @.data-paths = $*HOME.child('.hydrogen/data').Str, '/usr/share/hydrogen/data';

    has DrumkitInfo @.drumkits;

    method drumkits() {
        if @!drumkits.elems == 0 {
            my %seen;
            for @!data-paths.map({ $_.IO }) -> $data-path {
                if $data-path.d && $data-path.child('drumkits').d {
                    for $data-path.child('drumkits').dir -> $d-path {
                        if $d-path.d && $d-path.child('drumkit.xml').f {
                            my $base-name = $d-path.basename;
                            if not %seen{$base-name}:exists {
                                my $drumkit = DrumkitInfo.new(path => $d-path, name => $base-name);
                                @!drumkits.append: $drumkit;
                                %seen{$base-name} = True;
                            }
                        }
                    }
                }
            }
        }
        @!drumkits;
    }
}
# vim: expandtab shiftwidth=4 ft=perl6
