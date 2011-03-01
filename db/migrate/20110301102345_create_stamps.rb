class CreateStamps < ActiveRecord::Migration
  def self.up
    create_table :stamps do |t|
      t.integer :user_id
      t.string :label
      t.string :name
      t.string :phone
      t.string :email
      t.integer :template
      t.text :urls
      t.timestamps
    end
    add_index :stamps, :label, :unique => true
    add_index :stamps, :email, :unique => true
  end

  def self.down
    drop_table :stamps
  end
end
