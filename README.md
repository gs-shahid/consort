# Consort

[![Build Status](https://travis-ci.org/cmattson/consort.png?branch=master)](https://travis-ci.org/cmattson/consort)
[![Coverage Status](https://coveralls.io/repos/cmattson/consort/badge.png)](https://coveralls.io/r/cmattson/consort)
[![Code Climate](https://codeclimate.com/github/cmattson/consort.png)](https://codeclimate.com/github/cmattson/consort)
[![Gem Version](https://badge.fury.io/rb/consort.png)](http://badge.fury.io/rb/consort)

Mixing ActiveRecord and other ORMs like Mongoid? Need relationships between those data layers? Really hate either implementing a bunch of accessors or copy-pasting the same metaprogramming over and over again?

Use Consort! Built around a simple modification to standard ActiveRecord association syntax, Consort allows you to more easily retrieve data from cross-ORM single-to-single and single-to-many associations without writing or recycling code.

## Installation

Add this line to your application's Gemfile:

    gem 'consort'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install consort

## Requirements

Ruby 1.9.3 or 2.0.0. Alternate VMs compatible with these versions should also work.

Ruby 1.8 is not supported.

### Rails Compatibility

As Mongoid, most other NoSQL adapters, and many other gems are tied to Rails 3.2, master and version 1.0 are targeting Rails 3.2. Consort has not been tested against earlier Rails 3 versions; if you're stuck on an earlier version, let me know how it works for you.

Rails 4 support is planned.

## Usage

Consort allows basic relationships to be defined between ActiveRecord and other ORM layers. Simply add `_[ORM_TYPE]` to what you'd normally use. `active_record` and `mongoid` are currently supported.

On an ActiveRecord model, you can define relationships with Mongoid:
```ruby
class Airframe < ActiveRecord::Base
  belongs_to_mongoid  :manufacturer
  has_one_mongoid     :powerplant
  has_many_mongoids   :variants
end
```

On a Mongoid model, you can define relationships with ActiveRecord:
```ruby
class Airframe
  include Mongoid::Document
  belongs_to_active_record  :manufacturer
  has_one_active_record     :powerplant
  has_many_active_records   :variants
end
```

*Nota bene:* Consort currently provides only basic association accessors.  It does not implement callbacks. Consort also does not currently implement many-to-many associations. I've rarely run into a situation where cross-ORM many-to-many associations make sense, and implementing them would require making opinionated decisions I don't care to make without community input. If this is something you frequently find yourself needing, you'll have to implement it yourself. (Pull requests and feedback are welcome.)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. No, seriously, create a branch. Call it `ravenous-monkey` for all I care, but create a branch.
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request

Make sure you include tests! Tests are good. Tests are required. All hail tests. 

Consort tests are built with Minitest; beyond that, I'm flexible. `Minitest::Unit` and `Minitest::Spec` are both fine.


## Author

[Colin Mattson](https://github.com/cmattson)