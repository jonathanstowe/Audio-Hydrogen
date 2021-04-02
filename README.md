# Audio::Hydrogen

Work with Hydrogen songs and drumkits

![Build Status](https://github.com/jonathanstowe/Audio-Hydrogen/workflows/CI/badge.svg)

## Synopsis

```raku

use Audio::Hydrogen;

for Audio::Hydrogen.new.drumkits -> $dk {
    say $dk.name;
}

```

There are also some vaguely useful examples in the [examples](examples) directory.

## Description

This provides the facilities for creating and manipulating drumkit and
song data of the [Hydrogen](http://www.hydrogen-music.org/) drum software.

I originally wrote this with no other purpose than as a test for
[XML::Class](https://github.com/jonathanstowe/XML-Class) so it may well
be missing some features that you would like to see, but please see the
examples for things that you can do with it.

## Installation

Assuming you have a working Rakudo installation you should be able to install this with *zef* :

    # From the source directory
   
    zef install .

    # Remote installation

    zef install Audio::Hydrogen

Other install mechanisms may be become available in the future.

## Support

I'm sure this is almost certainly missing some useful features,
and am quite open to any ideas that could make it more useful.

I'd also be delighted to hear about anything interesting you
do with it.

Suggestions/patches are welcomed via [github](https://github.com/jonathanstowe/Audio-Hydrogen/issues)

## Licence

This is free software.

Please see the [LICENCE](LICENCE) file in the distribution

© Jonathan Stowe 2016 - 2021
