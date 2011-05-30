require 'spec_helper'

describe ArtisanEngine::Guidability do
  it "is an Engine" do
    ArtisanEngine::Guidability::Engine.ancestors.should include Rails::Engine
  end
  
  it "accepts an array of guidable models" do
    ArtisanEngine::Guidability.guidable_models += [ :narf, :snarf ]
    
    ArtisanEngine::Guidability.guidable_models.should include :narf
    ArtisanEngine::Guidability.guidable_models.should include :snarf
  end
end

describe "ArtisanEngine::Guidability Test/Development Environment" do
  it "initializes ArtisanEngine::Guidability" do
    ArtisanEngine::Guidability.should be_a Module
  end
  
  it "compiles its stylesheets into ArtisanEngine's stylesheets/artisan_engine/guidability directory" do
    Compass.configuration.css_path.should == "#{ ArtisanEngine.root }/lib/generators/artisan_engine/templates/assets/stylesheets/artisan_engine/guidability"
  end
  
  it "does not compile stylesheets during tests" do
    Sass::Plugin.options[ :never_update ].should be_true
  end
  
  it "compiles its javascripts into ArtisanEngine's javascripts/artisan_engine/guidability directory" do
    Barista.output_root.should == Pathname.new( "#{ ArtisanEngine.root }/lib/generators/artisan_engine/templates/assets/javascripts/artisan_engine/guidability" )
  end
end