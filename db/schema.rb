# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090812152326) do

  create_table "equipment", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.string   "description"
    t.text     "note"
    t.integer  "maintenance_periodicity_in_months"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maintenances", :force => true do |t|
    t.integer  "equipment_id"
    t.integer  "client_id"
    t.integer  "technician_id"
    t.string   "service_type"
    t.date     "scheduled_date_at"
    t.date     "effective_date_at"
    t.decimal  "duration_in_hours"
    t.boolean  "accepted"
    t.boolean  "completed"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "last_name"
    t.string   "phone"
    t.string   "address"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
  end

end
