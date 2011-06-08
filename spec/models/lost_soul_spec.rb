require 'spec_helper'

# Proxy for Guidable model.
describe LostSoul do
  let( :lost_soul ) { LostSoul.create! :name => 'Van Halen' }
  
  context "when destroying: " do
    it "destroys all associated guide links" do
      existing_guide = Factory :guide
      GuideLink.create! :guide => existing_guide, :guidable => lost_soul
      
      expect {
        lost_soul.destroy
      }.to change( GuideLink, :count ).by( -1 )
    end
  end
end