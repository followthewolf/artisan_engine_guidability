require File.expand_path( '../../../../acceptance_helper', __FILE__ )

feature 'Sort Guide Links', %q{
  In order to manage the order of my guide links
  As an artisan
  I want to sort my guide links.
} do
  
  scenario "I can sort my guide links" do
    # This is a cheater spec because I don't know how to make Selenium drag/drop
    # properly. 
    
    # It just tests that GuideLink is properly integrated with Listability
    # and assumes that the JS parameters are being sent properly.
    
    # If something goes wrong, check to make sure that sortable.serialize is
    # sending properly formatted parameters to the controller.
    
    # Given I have a guide and three guide links,
    @guide      = Guide.create!    :name => 'Primary Guide'
    @lost_soul1 = LostSoul.create! :name => 'Saint Jimmy'
    @lost_soul2 = LostSoul.create! :name => 'Zeitgard On Parade'
    @lost_soul3 = LostSoul.create! :name => 'Insubordinate'
    
    # When I sort my guide links,
    @guide_link1 = GuideLink.create! :guide => @guide, :guidable => @lost_soul1
    @guide_link2 = GuideLink.create! :guide => @guide, :guidable => @lost_soul2
    @guide_link3 = GuideLink.create! :guide => @guide, :guidable => @lost_soul3
    
    page.driver.post '/sort/guide_links', :guide_link => [ "#{ @guide_link3.id }",
                                                           "#{ @guide_link2.id }", 
                                                           "#{ @guide_link1.id }" ]

    # And I visit the manage guides page,
    visit '/manage/guides'

    # Then my guides should be in their sorted order.
    all( '.guide_link' )[0].text.should =~ /Insubordinate/
    all( '.guide_link' )[1].text.should =~ /Zeitgard On Parade/
    all( '.guide_link' )[2].text.should =~ /Saint Jimmy/
  end
end