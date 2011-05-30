require 'rails/generators/active_record'

module ArtisanEngine
  module Generators
    module Guidability
      class InstallGenerator < ActiveRecord::Generators::Base

        argument    :name, :default => 'guidability'
        source_root File.expand_path( '../templates', __FILE__ )
        
        def copy_initializer
          template 'initializers/guidability.rb', 
                   'config/initializers/guidability.rb'
        end
        
        def copy_installation_migration
          migration_template 'migrations/install_guidability.rb', 
                             'db/migrate/install_guidability.rb'
        end
        
      end
    end
  end
end