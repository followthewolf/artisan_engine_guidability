require File.expand_path( '../../../acceptance_helper', __FILE__ )

feature 'Delete a Guide', %q{
  In order to manage my navigation guides
  As an artisan
  I want to delete a guide.
} do

  background do
    # Given I am on the Manage Guides page,
    visit '/manage/guides'
    
    # And I have created a guide named 'Primary Navigation.'
    create_guide 'Primary Navigation'
    
    # And I have clicked the guide's remove link,
    within '.guide' do
      click_button 'Delete'
    end
  end
  
  scenario 'I can delete a guide' do
    # Then I should see a notice,
    page.should have_selector '.notice'
    
    # And I should see no guides.
    page.should have_no_selector '.guide'
  end
  
  scenario 'I can delete a guide via AJAX', :js => true do    
    # And I confirm in the modal box,
    accept_confirmation
    
    # Then I should see a notice,
    sleep 0.5 and page.should have_selector '.notice', :text => "Guide was successfully destroyed."
    
    # And I should see no guides.
    page.should have_no_selector '.guide'
  end
end