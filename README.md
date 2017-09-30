# [Namelib](https://rubygems.org/gems/namelib)

https://rubygems.org/gems/namelib

## Description

Namelib is a Ruby fork of NameCase, a library for
converting denormalized names to be properly cased.

## Example Usage

Let's say in your database, all the names of your clients were in uppercase and that you want to properly lowercase the right parts of them, then Namelib is for you!

```ruby
Namelib("RON BURGUNDY")              # => Ron Burgundy
Namelib("MCDONALDS")                 # => McDonalds
Namelib("VALÉRY GISCARD D'ESTAING")  # => Valéry Giscard d'Estaing
```

## Acknowledgements

This library is a port of a [Perl library by Mark Summerfield](https://metacpan.org/release/SUMMER/Lingua-EN-NameCase-1.12). 
And also a fork of the `NameCase` gem by Aaron Patterson.

## Authors

Original Version:
Copyright (c) Mark Summerfield 1998-2002.
All Rights Reserved

Ruby version:
Copyright (c) Aaron Patterson 2006-2015

Ruby fork:
Copyright (c) Gaspard d'Hautefeuille 2017

## License

Namelib is distributed under the GPL v2 license.  Please see the LICENSE file.
