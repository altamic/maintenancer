class Technician < User
  default_scope :conditions => {:role  => 'technician'}
  has_many :maintenances
  attr_protected :role
  
  has_many :maintenances
  has_many :equipments, :through => :maintenances
  
  # TODO: memoize serviced_equipments
  def serviced_equipments
    @serviced ||= Maintenance.find_all_by_technician_id(self).map(&:equipment_name).sort.uniq
  end
  
end