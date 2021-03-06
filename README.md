ruby-password_generator
=======================

[![Build Status](https://secure.travis-ci.org/kachick/ruby-password_generator.png)](http://travis-ci.org/kachick/ruby-password_generator)
[![Gem Version](https://badge.fury.io/rb/ruby-password_generator.png)](http://badge.fury.io/rb/password_generator)

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

Install
-------

```bash
gem install password_generator
```

Link
----

* [Home](http://kachick.github.com/ruby-password_generator/)
* [code](https://github.com/kachick/ruby-password_generator)
* [API](http://kachick.github.com/ruby-password_generator/yard/frames.html)
* [issues](https://github.com/kachick/ruby-password_generator/issues)
* [CI](http://travis-ci.org/#!/kachick/ruby-password_generator)
* [gem](https://rubygems.org/gems/password_generator)

License
--------

The MIT X11 License  
Copyright (c) 2013 Kenichi Kamiya  
See MIT-LICENSE for further details.