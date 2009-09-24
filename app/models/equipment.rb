class Equipment < ActiveRecord::Base
  has_many :maintenances
  has_many :clients, :through => :maintenances
  
end
