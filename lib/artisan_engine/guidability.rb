require 'artisan_engine/core'
require 'artisan_engine/listability'
require 'artisan_engine/guidability'

module ArtisanEngine
  module Guidability
    
    mattr_accessor :guidable_models
    def self.guidable_models
      @@guidable_models ||= []
    end
    
    # ------------------ Autoload Necessary Modules ------------------ #
    
    autoload :TestHelpers, 'artisan_engine/guidability/test_helpers' if Rails.env.test?
    autoload :IsGuidable, 'artisan_engine/guidability/is_guidable'
    
    # ------------------------- Vroom vroom! ------------------------- #
    
    class Engine < Rails::Engine
      initializer 'extend ActiveRecord' do
        ActiveRecord::Base.class_eval { include ArtisanEngine::Guidability::IsGuidable }
      end
    end

  end
end