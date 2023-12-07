# frozen_string_literal: true

require 'minitest/autorun'
require 'swiftlru'

class SwiftLRUTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::SwiftLRU::VERSION
  end
end
