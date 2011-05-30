module ArtisanEngine
  module Guidability
    module TestHelpers
      
      Factory.define :guide do |g|
        g.name  { Forgery( :name ).company_name.pluralize }
      end
      
      Factory.define :guide_link do |gl|
        gl.association :guide
        
        gl.after_build do |glg|
          glg.guidable = LostSoul.create!( :name => 'Saint Jimmy' )
        end
      end
      
      module Integration
        
        def create_guide( name )
          visit '/manage/guides'
          fill_in 'Name', :with => name
          click_button 'Create Guide'
        end
        
        def create_link_to( options = {} )
          guidable_class = options.keys[0]
          guidable_name  = options[ guidable_class ]
          guide_name     = options[ :in ]
          
          visit '/manage/guides'
          
          within '.guide', :text => guide_name do
            click_link 'Add a Link'
          end
          
          select guidable_name, :from => guidable_class.to_s.titleize.pluralize
          click_button 'Add Link'
        end
      end
    end
  end
end