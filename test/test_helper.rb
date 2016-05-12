ENV['RACK_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'tilt/erb'
require 'capybara/dsl'

module TestHelper
  def teardown
    task_manager.delete_all
    super
  end

  def task_manager
    database = Sequel.postgres('task_manager_test')
    @task_manager ||= TaskManager.new(database)
  end
end

Capybara.app = TaskManagerApp
#this is sinatra-specific, won't use in rails

class FeatureTest < Minitest::Test
  include Capybara::DSL
  #gives us access to capybara methods
  include TestHelper
end
