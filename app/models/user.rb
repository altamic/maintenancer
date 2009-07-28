class User < ActiveRecord::Base
  ROLES = %w(administrator secretary technician client)
  
  def name
    "#{first_name}"
  end
end