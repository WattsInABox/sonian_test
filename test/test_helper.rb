require 'rubygems'
require 'bundler/setup'
require 'test-unit'
require 'shoulda'

$LOAD_PATH.unshift(base_dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib')))
require_relative '../config/config'
