module Manage
  class GuideLinksController < Manage::BackController
    belongs_to :guide
    respond_to :html, :js
    
    def create
      @guide    = Guide.find( params[ :guide_id ] )
      @guidable = find_guidable_object
    
      @guide.guide_links.create( :guidable => @guidable )
      
      redirect_to manage_guides_path, :notice => 'Guide Link was successfully created.'
    end
    
    destroy! do |success, failure|
      success.html { redirect_to manage_guides_path, :notice => 'Guide Link was successfully destroyed.' }
      success.js   { @guides = Guide.all }
    end
    
    private
    
      # Find the guidable object given to the controller.
      def find_guidable_object
        guidable_class  = params[ :guide_link ][ :guidable_type ].constantize
        guidable_id     = params[ :guide_link ][ :guidable_id ]

        guidable_class.find( guidable_id )
      end
  end
end