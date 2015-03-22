require 'rubygems'
require 'bundler'
Bundler.require(:default)

map '/assets' do
  sprockets = Sprockets::Environment.new
  sprockets.append_path 'assets/stylesheets'
  run sprockets
end

require './news'
run TheNews
