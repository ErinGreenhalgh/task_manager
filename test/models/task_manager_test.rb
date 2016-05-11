require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  include TestHelper

  def test_it_creates_a_task
    task_manager.create({title: "TDD", description: "Learn to Test"})
    #task_manager is a method call from test helper module
    task = task_manager.find(1)
    assert_equal "TDD", task.title
    assert_equal "Learn to Test", task.description
    assert_equal 1, task.id
    #with abstraction into YAML, there is no way to
    #test create method without testing find method
  end
end
