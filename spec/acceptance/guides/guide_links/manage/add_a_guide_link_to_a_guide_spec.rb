require File.expand_path( '../../../../acceptance_helper', __FILE__ )

feature 'Add a Guide Link to a Guide', %q{
  In order to populate my guides with links
  As an artisan
  I want to add a link to a guide.
} do
  
  background do
    # Given I have created a guide named 'Primary Navigation.'
    create_guide 'Primary Navigation'
    
    # And I have created a guidable model named 'Lost Soul'
    @sj = LostSoul.create! :name => 'Saint Jimmy'
  end
  
  scenario 'I can add a link to a guide' do
    # When I click the Add a Link link
    click_link 'Add a Link'
    
    # And I select Saint Jimmy from the Lost Souls select list and click Add Link
    select 'Saint Jimmy', :from => 'Lost Souls'
    click_button 'Add Link'
    
    # Then I should see a notice,
    page.should have_selector '.notice'
    
    # Then I should see my new link within my guide
    within '.guide' do
      within '.guide_link', :text => 'Saint Jimmy' do
        page.should have_selector 'a', :href => "/lost_souls/#{ @sj.id }"
      end
    end
  end
end