class User < ActiveRecord::Base
  ROLES = %w(administrator secretary technician client)
  
  def name
    "#{first_name} #{last_name}"
  end
end