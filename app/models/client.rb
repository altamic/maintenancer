class Client < User
  has_many :maintenances
  has_one :equipment, :through => :maintenances
  
  default_scope :conditions => {:role  => 'client'}
  
  # pose maintenance for an equipment
  
  def change_scheduled_at(maintenance, date)
    # modify date of a pending maintenance
    # set the accepted flag to nil
  end
  
  # pose a new question for an equipment
  # view questions for her equipment
  
end