require_relative '../test_helper'

class UserSeesAllTasksTest < FeatureTest

  def test_user_sees_all_tasks
    #setup
    task1_id = task_manager.create({title: "Task1", description: "description1"})
    task2_id= task_manager.create({title: "Task2", description: "description2"})

    #exercise
    #go somewhere on a page and see that tasks exists
    visit '/tasks'
# save_and_open_page
#(launchy will open the page so you can see what's up;
#take this out when test passes)
    #verify
    #capybarra uses nokogiri to parse through html on a page
    assert page.has_content?("#{task1_id}: Task1")
    assert page.has_content?("#{task2_id}: Task2")
  end



end
