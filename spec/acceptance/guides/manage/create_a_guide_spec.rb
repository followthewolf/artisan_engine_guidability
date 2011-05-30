require File.expand_path( '../../../acceptance_helper', __FILE__ )

feature 'Create a Guide', %q{
  In order to display a navigation guide on my site
  As an artisan
  I want to create a guide.
} do
  
  background do
    # Given I am on the Manage Guides page,
    visit '/manage/guides'
  end
  
  context "with valid attributes: " do
    background do
      # When I fill in Name with Primary Navigation and click Create Guide,
      create_guide 'Primary Navigation'
    end
  
    scenario 'I can create a guide with valid attributes' do
      # Then I should see a notice,
      page.should have_selector '.notice'
    
      # And I should see my new guide.
      page.should have_selector '.guide', :text => 'Primary Navigation'
    end
  
    scenario 'I can create a guide with valid attributes via AJAX', :js => true do
      # Then I should see a notice,
      page.should have_selector '.notice', :text => "Guide was successfully created."

      # And I should see my new guide.
      page.should have_selector '.guide', :text => 'Primary Navigation'
    end
  end
  
  context "with invalid attributes: " do
    background do
      # When I fill in Name with nothing and click Create Guide,
      fill_in 'Name', :with => ''
      click_button 'Create Guide'
    end
  
    scenario 'I cannot create a guide with invalid attributes' do
      # Then I should see an alert,
      page.should have_selector '.alert'
    
      # And I should not see any guides.
      page.should have_no_selector '.guide'
    end
  
    scenario 'I cannot create a guide with invalid attributes via AJAX', :js => true do
      # Then I should see an alert,
      page.should have_selector '.alert'
    
      # And I should not see any guides.
      page.should have_no_selector '.guide'
    end
  end
end