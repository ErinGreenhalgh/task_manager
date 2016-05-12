require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  include TestHelper

  def test_it_creates_a_task
    task_id = task_manager.create({title: "TDD", description: "Learn to Test"})
    #create returns the primary key value of what was created
    task = task_manager.find(task_id)
    assert_equal "TDD", task.title
    assert_equal "Learn to Test", task.description
    assert_equal task_id, task.id
  end

  def test_it_can_find_all_the_tasks
    task_manager.create({title: "TDD", description: "Learn to Test"})
    task_manager.create({title: "Task2", description: "Do stuff"})
    task_manager.create({title: "Task3", description: "Other stuff"})

    tasks = task_manager.all
    assert_equal 3, tasks.count
    assert_equal "TDD", tasks.first.title
  end

  def test_it_can_find_a_single_task
    task_manager.create({title: "TDD", description: "Learn to Test"})
    task = task_manager.find(1)
    assert_equal Task, task_manager.find(1).class
    assert_equal "TDD", task.title
  end

  def test_it_can_update_a_task
    task_manager.create({title: "TDD", description: "Learn to Test"})
    task_manager.update(1, {title: "UPDATED", description: "Learn to Test"})
    task_updated = task_manager.find(1)
    assert_equal "UPDATED", task_updated.title
  end

  def test_it_can_destroy_a_task
    task_manager.create({title: "TDD", description: "Learn to Test"})
    assert_equal 1, task_manager.all.count
    task_manager.destroy(1)
    assert_equal 0, task_manager.all.count
  end

end
