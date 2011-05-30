class Guide < ActiveRecord::Base
  has_many              :guide_links, :dependent => :destroy
  validates_presence_of :name
  has_listability
end