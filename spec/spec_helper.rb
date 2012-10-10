require 'simplecov'
SimpleCov.start do
  add_filter "/spec/"
end

require 'minitest/spec'
require 'minitest/autorun'
require 'turn'
require 'webmock/minitest'

Turn.config do |c|
 c.format  = :dotted
 c.natural = true
 c.trace   = 2
end

require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.ignore_hosts 'ignore.me'
end

unless defined?(SPEC_HELPER_LOADED)
  SPEC_HELPER_LOADED = true
  require "rubygems"
  $LOAD_PATH << File.dirname(__FILE__) + '/../lib'
  require "veritrans"
end

