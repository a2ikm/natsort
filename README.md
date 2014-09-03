[![Build Status](https://travis-ci.org/a2ikm/natsort.svg)](https://travis-ci.org/a2ikm/natsort)

# natsort

This gem provides natural sorting methods to `Enumerable`.

## Installation

Add this line to your application's Gemfile:

    gem 'natsort'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install natsort

## Usage

```ruby
%w(1 10 2).natsort
#=> ["1", "2", "10"]
```

or

```ruby
[
  { "n" => "1" },
  { "n" => "10" },
  { "n" => "2" }
].natsort_by { |x| x["n"] }
#=> [
      { "n" => "1" },
      { "n" => "2" },
      { "n" => "10" }
    ]
```

These sorts are case sensitive by default.
If you want to sort objects in case insensitive, pass `false` to the methods.

```ruby
%w(B a c).natsort(false)
#=> ["a", "B", "c"]
```

or

```ruby
[
  { "n" => "B" },
  { "n" => "a" },
  { "n" => "c" }
].natsort_by(false) { |x| x["n"] }
#=> [
      { "n" => "a" },
      { "n" => "B" },
      { "n" => "c" }
    ]
```

## Contributing

1. Fork it ( https://github.com/a2ikm/natsort/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
