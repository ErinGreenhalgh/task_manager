ENV['RACK_ENV'] ||= 'test'
#changing Rack environment, the way we interact with thweb
#this says that this file is in our test environment

require File.expand_path('../../config/environment', __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'tilt/erb'

module TestHelper
  def tear_down
    task_manager.delete_all
  end

  def task_manager
    database = YAML::Store.new('db/task_manager_test')
    #creates a new db for testing purposes
    @task_manager ||= TaskManager.new(database)
  end
end
