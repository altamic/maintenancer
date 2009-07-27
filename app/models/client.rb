class Client < User
  has_many :maintenances
  has_one :equipment, :through => :maintenances
  
  default_scope :conditions => {:role  => 'client'}
  
  # TODO: define incoming_maintenances and executed_maintenances named_scopes
  named_scope :incoming, lambda { |*args| {:conditions => {" scheduled_date_at < #{Time.now}"}} }
	named_scope :executed # ordinate dal piu' recente
end