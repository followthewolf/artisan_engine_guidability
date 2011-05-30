require 'spec_helper'

describe GuideLink do
  let( :new_link ) { GuideLink.new :guide    => mock_model( Guide ),
                                   :guidable => mock_model( LostSoul ) }
  
  context "validations: " do
    it "is valid with valid attributes" do
      new_link.should be_valid
    end
  
    it "is not valid without a guide" do
      new_link.guide = nil
      new_link.should_not be_valid
    end
  
    it "is not valid without a guidable" do
      new_link.guidable = nil
      new_link.should_not be_valid
    end
  end
end