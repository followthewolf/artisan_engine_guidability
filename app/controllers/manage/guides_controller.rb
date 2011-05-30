module Manage
  class GuidesController < Manage::BackController
    respond_to :html, :js
    
    create! do |success, failure|
      failure.html { redirect_to manage_guides_path, :alert => 'Guide could not be saved.' }
      
      success.js   { @guides = Guide.all }
      failure.js do 
        @guides = Guide.all
        flash.now[ :alert ] = 'Guide could not be created.'
        render :create
      end
    end
    
    update! do |success, failure|
      failure.html { flash[ :alert ] = 'Guide could not be saved.'; render :edit }
    end
    
    destroy! do |success, failure|
      success.js { @guides = Guide.all }
    end
  end
end