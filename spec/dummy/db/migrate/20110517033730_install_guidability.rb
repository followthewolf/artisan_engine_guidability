class InstallGuidability < ActiveRecord::Migration
  
  def self.up
    create_table :guides do |t|
      t.string      :name,        :null => false
      t.integer     :position,    :null => false
      
      t.timestamps
    end
    
    create_table :guide_links do |t|
      t.integer     :guide_id,    :null => false
      t.references  :guidable,    :polymorphic => true
      t.integer     :position,    :null => false
      
      t.timestamps
    end
  end

  def self.down
    drop_table :guides
    drop_table :guide_links
  end
  
end
