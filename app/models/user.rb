class User < ActiveRecord::Base
  ROLES = %w(administrator secretary technician client)
  validates_presence_of :role
  
  acts_as_authentic

  def name
    "#{first_name} #{last_name}"
  end
end