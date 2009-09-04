class User < ActiveRecord::Base
  ROLES = %w(administrator secretary technician client)
  
  acts_as_authentic
  
  def name
    "#{first_name} #{last_name}"
  end
end