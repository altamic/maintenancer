class RenameNameToFirstNameFromUsers < ActiveRecord::Migration
  def self.up
    rename_column(:users, :name, :first_name)
  end

  def self.down
    rename_column(:users, :first_name, :name)
  end
end
