class AddExtraFieldsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :admin, :boolean, :default => false
    add_column :users, :name, :string
    add_column :users, :company, :string
    add_column :users, :designation, :string
    add_column :users, :address, :text
    add_column :users, :mobile, :string
    add_column :users, :landline, :string
    add_column :users, :fax, :string
  end

  def self.down
    remove_column :users, :fax
    remove_column :users, :landline
    remove_column :users, :mobile
    remove_column :users, :address
    remove_column :users, :designation
    remove_column :users, :company
    remove_column :users, :name
    remove_column :users, :admin
  end
end
