class User < ActiveRecord::Base
  extend ActiveSupport::Memoizable
  
  ROLES = %w(administrator secretary technician client)
  validates_presence_of :role

  acts_as_authentic

  User::ROLES.each do |role|
    define_method "#{role}?" do             # def administrator?
      role == self.role                     #   "administrator" == self.role
    end                                     # end
  end
  
  User::ROLES.each do |role|
    define_method "not_#{role}?" do         # def not_administrator?
      role != self.role                     #   "administrator" != current_user.role
    end                                     # end
  end

  def salutation
    "#{role.capitalize}  #{name.split(' ').first.capitalize}"
  end
  
  def name
    "#{first_name} #{last_name}"
  end
  memoize :salutation, :name
  
end