require 'rubygems'
require 'bundler'

Bundler.require

require 'service'

root_dir = File.dirname(__FILE__)

RACK_ENV = ENV['RACK_ENV'] || :development
BlogApplication.set :environment, RACK_ENV
BlogApplication.set :root,  root_dir
BlogApplication.set :app_file, File.join(root_dir, 'service.rb')
BlogApplication.disable :run

run BlogApplication
