require File.expand_path( '../../../../acceptance_helper', __FILE__ )

feature 'Delete a Guide Link from a Guide', %q{
  In order to manage my guides' links
  As an artisan
  I want to delete a guide link from a guide.
} do
  
  background do 
    # Given I have created a guide named 'Primary Navigation,'
    create_guide 'Primary Navigation'
    
    # And I have created a guidable model,
    @sj = LostSoul.create! :name => 'Saint Jimmy'
    
    # And I have created a guide link between my guide and guidable model,
    create_link_to :lost_soul => 'Saint Jimmy', :in => 'Primary Navigation'
    
    # And I have clicked the guide link's delete button,
    within '.guide_link' do
      click_button 'Delete'
    end
  end
  
  scenario "I can delete a guide link from a guide" do
    # Then I should see a notice,
    page.should have_selector '.notice', :text => 'Guide Link was successfully destroyed.'
    
    # And I should see no guide links in my guide.
    within '.guide' do
      page.should have_no_selector '.guide_link'
    end
  end
  
  scenario "I can delete a guide link from a guide via AJAX", :js => true do
    # When I confirm in the modal window,
    accept_confirmation
    
    # Then I should see a notice,
    page.should have_selector '.notice', :text => 'Guide Link was successfully destroyed.'
    
    # And I should see no guide links in my guide.
    within '.guide' do
      page.should have_no_selector '.guide_link'
    end
  end
end