# lib/tasks/populate.rake

namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    def email(first_name, last_name)
      "#{first_name.first.downcase}.#{last_name.downcase}@#{Faker::Internet.domain_name}"
    end
    
    [User, Equipment, Maintenance].each(&:delete_all)
    
    Administrator.populate 1 do |admin|
      admin.first_name  = 'Michelangelo'
      admin.last_name   = 'Altamore'
      admin.phone       = Faker::PhoneNumber.phone_number
      admin.address     = "#{Faker::Address.street_address}\n#{Faker::Address.city}"
      admin.email       = "m.altamore@#{Faker::Internet.domain_name}"
      admin.role        = 'administrator'
    end
    
    Secretary.populate 2 do |secretary|
      secretary.first_name   = Faker::Name.first_name
      secretary.last_name    = Faker::Name.last_name
      secretary.phone        = Faker::PhoneNumber.phone_number
      secretary.address      = "#{Faker::Address.street_address}\n#{Faker::Address.city}"
      secretary.email        = email(secretary.first_name, secretary.last_name)
      secretary.role         = 'secretary'
    end
    
    Technician.populate 6 do |technician|
      technician.first_name  = Faker::Name.first_name
      technician.last_name   = Faker::Name.last_name
      technician.phone       = Faker::PhoneNumber.phone_number
      technician.address     = "#{Faker::Address.street_address}\n#{Faker::Address.city}"
      technician.email       = email(technician.first_name, technician.last_name)
      technician.role        = 'technician'
    end
    
    Client.populate 12 do |client|
      client.first_name      = Faker::Name.first_name
      client.last_name       = Faker::Name.last_name
      client.phone           = Faker::PhoneNumber.phone_number
      client.address         = "#{Faker::Address.street_address}\n#{Faker::Address.city}"
      client.email           = email(client.first_name, client.last_name)
      client.role            = 'client'
    end
    
    Equipment.populate 30 do |equipment|
      equipment.name                              = "Equipment #{Faker::Name.last_name}"
      equipment.code                              = Faker::PhoneNumber.phone_number
      equipment.description                       = Faker::Lorem.sentence
      equipment.note                              = Faker::Lorem.paragraph
      equipment.maintenance_periodicity_in_months = [3, 6, 12, 18]
    end
    
    Maintenance.populate 100 do |maintenance|
      maintenance.equipment_id      = Equipment.all.map(&:id)
      maintenance.client_id         = Client.all.map(&:id)
      maintenance.technician_id     = Technician.all.map(&:id)
      maintenance.service_type      = ['ordinario', 'straordinario']
      maintenance.accepted          = [nil, true, false]
      maintenance.completed         = [true, false]
      maintenance.scheduled_date_at = maintenance.accepted ? [1.month.from_now..6.month.from_now] : nil
      maintenance.effective_date_at = nil
      maintenance.duration_in_hours = maintenance.completed ? [0.5, 1.0, 2.0, 2.5, 3.0, 3.5, 4] : nil 
      maintenance.note              = Faker::Lorem.paragraph
    end
  end
end
