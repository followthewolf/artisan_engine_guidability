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
    
    # ------------------------- Vroom vroom! ------------------------- #
    
    class Engine < Rails::Engine
    end

  end
end