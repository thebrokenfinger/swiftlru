# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'swiftlru'
  s.version     = '0.1.0'
  s.summary     = 'A tiny, fast LRU cache'
  s.description = 'A Least Recently Used (LRU) cache in Ruby designed to be fast and simple.'
  s.authors     = ['Yatharth K']
  s.email       = 'yatharth01@gmail.com'
  s.license     = 'MIT'
  s.files       = Dir['lib/**/*']
  s.homepage    = 'https://rubygems.org/gems/swiftlru'
  s.required_ruby_version = '>= 2.7.0'
end
