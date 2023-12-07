# frozen_string_literal: true

require 'minitest/autorun'
require 'swiftlru'

class SwiftLRUCacheTest < Minitest::Test
  def test_that_it_raises_argument_error_when_max_size_is_not_provided
    assert_raises(ArgumentError) { SwiftLRU::Cache.new }
  end

  def test_that_it_raises_argument_error_when_max_size_is_not_an_integer
    assert_raises(ArgumentError) { SwiftLRU::Cache.new('foo') }
  end

  def test_that_it_raises_argument_error_when_max_size_is_not_greater_than_zero
    assert_raises(ArgumentError) { SwiftLRU::Cache.new(0) }
  end

  def test_that_it_creates_a_new_cache
    cache = SwiftLRU::Cache.new(1)
    assert_instance_of(SwiftLRU::Cache, cache)
  end

  def test_that_it_has_a_max_size
    cache = SwiftLRU::Cache.new(1)
    assert_equal(1, cache.max_size)
  end

  def test_that_it_has_a_size
    cache = SwiftLRU::Cache.new(1)
    assert_equal(0, cache.size)
  end

  def test_that_it_stores_keyvalue_in_cache
    cache = SwiftLRU::Cache.new(2)
    cache.set('foo', 'bar')
    assert_equal(1, cache.size)
  end
end
