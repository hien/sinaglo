require 'sinatra'
require 'service'

root_dir = File.dirname(__FILE__)

RACK_ENV = ENV['RACK_ENV'] || :development
set :environment, RACK_ENV
set :root,  root_dir
set :app_file, File.join(root_dir, 'service.rb')
disable :run

run BlogApplication
