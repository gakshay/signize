class CreateStamps < ActiveRecord::Migration
  def self.up
    create_table :stamps do |t|
      t.integer :user_id
      t.string :label, :limit => 100
      t.string :name, :limit => 100
      t.string :email, :limit => 100
      t.string :mobile, :limit => 100
      t.string :company, :limit => 150
      t.string :domain, :limit => 100
      t.string :designation, :limit => 100
      t.string :landline, :limit => 100
      t.string :faxno, :limit => 100
      t.string :promotion_text, :limit => 100
      t.string :promotion_url, :limit => 100
      t.integer :promotion_image      
      t.integer :template
      t.text :address, :limit => 100
      t.string :country, :limit => 100
      t.text :urls
      t.text :social_urls
      t.text :disclaimer
      t.text :data
      t.timestamps
    end
    add_index :stamps, :email
    add_index :stamps, :user_id
  end

  def self.down
    drop_table :stamps
  end
end
