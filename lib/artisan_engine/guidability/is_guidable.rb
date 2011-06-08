module ArtisanEngine
  module Guidability
    module IsGuidable
      def self.included( base )
        base.extend ClassMethods
      end
      
      module ClassMethods
        def is_guidable
          has_many :guide_links, :as => :guidable, :dependent => :destroy
        end
      end
    end
  end
end