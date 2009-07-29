class Technician < User
  default_scope :conditions => {:role  => 'technician'}
  
  # mark maintenance as completed
  
  # TODO: memoize serviced_equipments
  def serviced_equipments
    @serviced ||= Maintenance.find_all_by_technician_id(self).map(&:equipment_name).sort.uniq
  end
  
end