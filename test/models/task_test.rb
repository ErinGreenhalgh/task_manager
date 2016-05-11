require_relative '../test_helper'

class TaskTest < Minitest::Test

  def test_it_assigns_attributes_correctly
    task = Task.new({ "title" => "New Task",
                      'description' => "Task Description",
                      'id' => 1  })
    assert_equal "New Task", task.title
    assert_equal "Task Description", task.description
    assert_equal 1, task.id
  end

end
