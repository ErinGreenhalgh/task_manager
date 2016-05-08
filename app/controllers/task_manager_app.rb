require 'models/task_manager'
require 'models/task'

class TaskManagerApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  #specifies that the root is app
  #b/c sinatra looks relative to our app for views and stylesheets

  get '/' do
    erb :dashboard
  end

  get '/tasks' do
    @tasks = task_manager.all
    erb :index
    #render index.erb file
  end

  get '/tasks/new' do
    erb :new
  end

  post '/tasks' do
    task_manager.create(params[:task])
    redirect '/tasks'
  end

  get '/tasks/:id' do |id|
    @task = task_manager.find(id.to_i)
    erb :show
  end 

  def task_manager
    database = YAML::Store.new('db/task_manager')
    @task_manager ||= TaskManager.new(database)
  end

end
