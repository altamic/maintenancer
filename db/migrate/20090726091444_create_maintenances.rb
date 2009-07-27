class CreateMaintenances < ActiveRecord::Migration
  def self.up
    create_table :maintenances do |t|
      t.references :equipment
      t.references :client
      t.references :technician
      t.string :service_type
      t.date :scheduled_date_at
      t.date :effective_date_at
      t.decimal :duration_in_hours
      t.boolean :accepted
      t.boolean :completed
      t.text :note
      t.timestamps
    end
  end
  
  def self.down
    drop_table :maintenances
  end
end
