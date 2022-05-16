ruby-password_generator
=======================

* ***This repository is archived***
* ***No longer maintained***
* ***All versions have been yanked from https://rubygems.org for releasing valuable namespace for others***

Description
-----------

A generator of daily passwords

Features
--------

* Using SecureRandom
* Customizable to choose characters

Usage
-----

```ruby
require 'password_generator'

p PasswordGenerator.generate(8)
p PasswordGenerator.generate(24, avoid_symbols: true)
p PasswordGenerator.generate(24, avoid_downcases: true)
p PasswordGenerator.generate(24, avoid_uppercases: true)
```

Requirements
-------------

* Ruby - [2.5 or later](http://travis-ci.org/#!/kachick/ruby-password_generator)

License
--------

The MIT X11 License  
Copyright (c) 2013 Kenichi Kamiya  
See MIT-LICENSE for further details.