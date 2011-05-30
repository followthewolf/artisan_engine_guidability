Gem::Specification.new do |s|
  s.name        = 'artisan_engine_guidability'
  s.summary     = 'ArtisanEngine models can be guidable.'
  s.description = 'Provides a Guide model and interface for creating navigation guides.'
  s.files       = Dir[ "{ app, config, lib }/**/*" ] + [ "Gemfile" ]
  s.version     = '0.0.1'

  # --------------------- Runtime Dependencies --------------------- #
  ## --------------------------- Basics --------------------------- ##
  
  s.add_runtime_dependency      'artisan_engine_core'
  s.add_runtime_dependency      'artisan_engine_listability'
  
  # ------------------- Development Dependencies ------------------- #
  ## ------------------------- Test Suite ------------------------- ##
  
  s.add_development_dependency  'rspec-rails',          '2.5.0'
  s.add_development_dependency  'steak',                '1.1.0'
  s.add_development_dependency  'capybara',             '0.4.1.2'
  s.add_development_dependency  'database_cleaner',     '0.6.7'
  s.add_development_dependency  'launchy',              '0.4.0'
  
  ## -------------------- Sample Data Creation -------------------- ##
  
  s.add_development_dependency  'factory_girl_rails',   '1.0.1'
  s.add_development_dependency  'forgery',              '0.3.8'

end