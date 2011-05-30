class GuideLink < ActiveRecord::Base
  belongs_to :guide
  belongs_to :guidable, :polymorphic => true
  
  validates_presence_of :guide
  validates_presence_of :guidable
  
  has_listability :within => :guide
end