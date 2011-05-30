class CreateLostSouls < ActiveRecord::Migration
  def self.up
    create_table :lost_souls do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :lost_souls
  end
end
