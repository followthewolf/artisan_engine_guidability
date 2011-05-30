require File.expand_path( '../../acceptance_helper', __FILE__ )

feature 'View a Guide', %q{
  In order to navigate the website
  As a patron
  I want to view a guide.
} do
  
  background do
    # Given there is a guide,
    create_guide 'Primary Navigation'
    
    # And there are three guidables,
    LostSoul.create! :name => 'Saint Jimmy'
    LostSoul.create! :name => 'Zeitgard on Parade'
    LostSoul.create! :name => 'Insubordinate'
    
    # And the guidables have been linked to the guide,
    create_link_to :lost_soul => 'Saint Jimmy',        :in => 'Primary Navigation'
    create_link_to :lost_soul => 'Zeitgard on Parade', :in => 'Primary Navigation'
    create_link_to :lost_soul => 'Insubordinate',      :in => 'Primary Navigation'
    
    # And I am visiting a page where the guide is displayed,
    visit '/guide_preview'
  end
  
  scenario "I can view a guide and see its links" do
    # Then I should see the guide and its links.
    within '.guide' do
      page.should have_selector '.guide_link', :count => 3
      page.should have_selector 'a', :text => 'Saint Jimmy'
      page.should have_selector 'a', :text => 'Zeitgard on Parade'
      page.should have_selector 'a', :text => 'Insubordinate'
    end
  end
end