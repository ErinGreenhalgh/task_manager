require 'bundler'
Bundler.require

#get the path of the root of our project
APP_ROOT = File.expand_path("..", __dir__)

#connect all the files directly upon fireup
#required all the controllers
Dir.glob(File.join(APP_ROOT, 'app', 'controllers', '*.rb')).each { |file| require file}
#require all the models; iterate through and require each
Dir.glob(File.join(APP_ROOT , 'app', 'models', '*.rb')).each { |file| require file}
#don't need to require files throughout app, except yaml store

class TaskManagerApp < Sinatra::Base
  #bringing some configurations from the controller file over here
  set :root, APP_ROOT
  set :method_override, true

  #allows us to have multiple subdirectories within views
  set :views, File.join(APP_ROOT, 'app', 'views')

  set :public_folder, File.join(APP_ROOT, 'app', 'public')
end
