class Client < User
  has_many :maintenances
  has_one :equipment, :through => :maintenances
  
  default_scope :conditions => {:role  => 'client'}
  
  # change a scheduled date for an existing maintenance of hers
  delegate :change_scheduled_date, :to => :maintenance 
  
  # request a maintenance for an equipment
  # equipment_id: integer, client_id: integer
  # service_type: string, scheduled_date_at: date
  # TODO: test test test
  def request_maintenance(equipment, priority)
    self.maintenances.build(:equipment_id => equipment.id, :service_type => priority)
  end
  
  # pose a new question for an equipment
  def question(equipment)
    self.question.build(:equipment_id => equipment_id)
  end
  
  # view questions for her equipment
end