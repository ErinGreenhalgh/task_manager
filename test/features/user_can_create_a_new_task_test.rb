require_relative '../test_helper'

class UserCanCreateANewTaskTest < FeatureTest

  def test_user_creates_task
    visit '/'

    click_link 'New Task'

    assert_equal '/tasks/new', current_path
    #check if you are on the right path

    fill_in 'task[title]', with: "Learn Capybara"
    #select by name, can also select by label
    fill_in  'task[description]', with: "Capybara and Launchy"

# save_and_open_page
    click_button 'submit'
    #use value for button
    #within(".task-1") do this scopes it down to a specific CSS class
    assert page.has_content?("Learn Capybara")
    # end
  end
end
