require File.expand_path( '../../../acceptance_helper', __FILE__ )

feature 'Update a Guide', %q{
  In order to manage my navigation guides
  As an artisan
  I want to update a guide.
} do

  background do
    # Given I am on the Manage Guides page,
    visit '/manage/guides'
    
    # And I have created a guide named 'Primary Navigation.'
    create_guide 'Primary Navigation'
    
    # And I have clicked the guide's Edit link,
    within '.guide' do
      click_link 'Edit'
    end
  end
  
  scenario "I can update a guide with valid attributes" do
    # When I fill in a new name and click Update Guide,
    fill_in 'Name', :with => 'Secondary Navigation'
    click_button 'Update Guide'

    # Then I should see a notice,
    page.should have_selector '.notice', :text => 'Guide was successfully updated.'
    
    # And I should see my new guide.
    page.should have_selector '.guide', :text => 'Secondary Navigation'
  end
  
  scenario "I can update a guide with invalid attributes" do
    # When I fill in an invalid new name and click Update Guide,
    fill_in 'Name', :with => ''
    click_button 'Update Guide'

    # Then I should see an alert,
    page.should have_selector '.alert'
  end
end
