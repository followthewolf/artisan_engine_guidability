require 'spec_helper'

describe Guide do
  let( :new_guide ) { Guide.new :name => 'Primary Guide' }
  
  context "validations: " do
    it "is valid with valid attributes" do
      new_guide.should be_valid
    end
    
    it "is not valid without a name" do
      new_guide.name = nil
      new_guide.should_not be_valid
    end
  end
  
  context "when destroying: " do
    it "destroys all associated guide links" do
      existing_guide      = Factory :guide
      existing_guide_link = Factory :guide_link, :guide => existing_guide
      
      expect {
        existing_guide.destroy
      }.to change( GuideLink, :count ).by( -1 )
    end
  end
end