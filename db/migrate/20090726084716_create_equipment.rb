class CreateEquipment < ActiveRecord::Migration
  def self.up
    create_table :equipment do |t|
      t.string :name
      t.string :code
      t.string :description
      t.text :note
      t.integer :maintenance_periodicity_in_months
      t.timestamps
    end
  end
  
  def self.down
    drop_table :equipment
  end
end
