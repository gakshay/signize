class CreateStamps < ActiveRecord::Migration
  def self.up
    create_table :stamps do |t|
      t.integer :user_id
      t.string :label, :limit => 100
      t.string :name, :limit => 100
      t.string :email, :limit => 100
      t.string :phone
      t.string :mobile
      t.string :faxno
      t.integer :template
      t.string :company
      t.string :designation, :limit => 100
      t.string :address, :limit => 100
      t.string :country, :limit => 100
      t.text :urls
      t.text :social_urls
      t.text :disclaimer
      t.text :data
      t.timestamps
    end
    add_index :stamps, :email, :unique => true
    add_index :stamps, :user_id, :unique => true
  end

  def self.down
    drop_table :stamps
  end
end
