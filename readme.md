# swiftlru [![Gem Version](https://badge.fury.io/rb/swiftlru.svg)](https://badge.fury.io/rb/swiftlru)

A tiny, fast LRU cache written in Ruby with no dependencies.

---

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'swiftlru'
```

And then execute:

    $ bundle

## Usage

```ruby

require 'swiftlru'

# Create a cache with a max size of 3
cache = SwiftLRU::Cache.new(3)

# Add some items
cache.set('a', 1)
cache.set('b', 2)
cache.set('c', 3)

# Get an item
cache.get('a') # => 1

# The cache can be cleared
cache.clear
```

## Algorithm

The algorithm is an optimized version of LRU (Least Recently Used) cache eviction scheme. It is based on algorithm described in [this repo](https://github.com/dominictarr/hashlru).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
