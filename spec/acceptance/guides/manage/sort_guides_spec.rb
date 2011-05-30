require File.expand_path( '../../../acceptance_helper', __FILE__ )

feature 'Sort Guides', %q{
  In order to manage the order of my navigation guides
  As an artisan
  I want to sort my guides.
} do
  
  scenario "I can sort my guides" do
    # This is a cheater spec because I don't know how to make Selenium drag/drop
    # properly. 
    
    # It just tests that Guide is properly integrated with Listability
    # and assumes that the JS parameters are being sent properly.
    
    # If something goes wrong, check to make sure that sortable.serialize is
    # sending properly formatted parameters to the controller.
    
    # Given I have three guides,
    @guide1 = Guide.create! :name => 'Guide 1'
    @guide2 = Guide.create! :name => 'Guide 2'
    @guide3 = Guide.create! :name => 'Guide 3'
    
    # When I sort my guides
    page.driver.post '/sort/guides', :guide => [ "#{ @guide3.id }",
                                                 "#{ @guide2.id }", 
                                                 "#{ @guide1.id }" ]
    
    # And I visit the manage guides page,
    visit '/manage/guides'

    # Then my guides should be in their sorted order.
    all( '.guide' )[0].text.should =~ /Guide 3/
    all( '.guide' )[1].text.should =~ /Guide 2/
    all( '.guide' )[2].text.should =~ /Guide 1/
  end
end