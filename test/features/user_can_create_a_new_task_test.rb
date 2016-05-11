require_relative '../test_helper'

class UserCanCreateANewTaskTest < FeatureTest

  def test_user_creates_task
    visit '/'

    click_link 'New Task'

    fill_in 'task[title]', with: "Learn Capybara"
    #select by name, can also select by label
    fill_in  'task[description]', with: "Capybara and Launchy"

# save_and_open_page
    click_button 'submit'
    #use value for button

    assert page.has_content?("Learn Capybara")
    # assert page.has_content?
  end
end
