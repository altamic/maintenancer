class Equipment < ActiveRecord::Base
  has_many :maintenances
  has_one :client, :through => :maintenances
  has_many :issues, :class_name => 'Question'
  
end
