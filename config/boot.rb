#require gems
ENV["RACK_ENV"] ||= "development"
Bundler.require :default, ENV["RACK_ENV"].to_sym

#config
set :root, File.expand_path(".")
set :views, settings.root + "/app/views"

#connect mysql
ActiveRecord::Base.establish_connection YAML.load_file(settings.root + '/config/database.yml')[ENV['RACK_ENV'].to_s]

#require controllor files
Dir.glob "./{lib,app/models,app/helpers,app/controllers}/**/*.rb" do |f|
  require f
end