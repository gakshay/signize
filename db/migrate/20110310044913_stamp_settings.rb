class StampSettings < ActiveRecord::Migration
  def self.up
    create_table :stamp_settings do |t|
      t.integer :stamp_id
      t.text :settings
    end
    add_index :stamp_settings, :stamp_id
  end

  def self.down
     drop_table :stamp_settings
  end
end
