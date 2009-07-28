class AddLastNamePhoneAddressEmailToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :last_name, :string
    add_column :users, :phone, :string
    add_column :users, :address, :string
    add_column :users, :email, :string
  end

  def self.down
    remove_column :users, :email
    remove_column :users, :address
    remove_column :users, :phone
    remove_column :users, :last_name
  end
end
