class Maintenance < ActiveRecord::Base
  STATUSES = %w(accepted refused pending complete)
  SERVICE_TYPES = %w(regular occasional urgent)
  
  belongs_to :equipment
  belongs_to :client
  belongs_to :technician
  
  delegate :name, :to => :equipment, :prefix => true
  delegate :name, :to => :client, :prefix => true
  delegate :name, :to => :technician, :prefix => true
  
  named_scope :incoming, 
    lambda { |*args| { :conditions => ["scheduled_date_at < ?", (args.first || Time.now)] } }
  
  named_scope :late, 
    lambda { |*args| { :conditions => ["scheduled_date_at > ?", (args.first || Time.now)] } }
  
  named_scope :recent,
    lambda { |*args| { :conditions => ["scheduled_date_at > ?", (args.first || 3.months.ago)] } }
  
  named_scope :pending, :conditions => { :accepted => true, :completed => false }
  named_scope :refused, :conditions => { :accepted => false, :completed => false }
  named_scope :completed, :conditions => { :accepted => true, :completed => true }
  named_scope :proposed, :conditions => { :accepted => nil }
  
  attr_accessor :change_scheduled_date
  before_save :assign_changed_scheduled_date
  
  def name
    case status
    when 'pending'
      return "#{status} maintenance scheduled on #{scheduled_date_at} for #{equipment_name} of #{client_name}"
    when 'completed'
      return "maintenance #{status} on #{scheduled_date_at} for #{equipment_name} of #{client_name}"
    when ('proposed' or 'refused')
      return "#{status} maintenance for #{equipment_name} of #{client_name}"
    end
  end
  
  named_scope :status, lambda { |value| self.send(:compute_conditions, value) }
  
  def status
    if accepted and completed
      return "completed"
    elsif  accepted and not completed
      return "pending"
    elsif accepted.nil?
      return "proposed"
    elsif not accepted 
      return "refused"
    end
  end
  
  private
  def self.compute_conditions(value)
    self.send(value).proxy_options
  end
  
  def assign_changed_scheduled_date
    self.scheduled_date_at, self.accepted = @change_scheduled_date, nil unless @change_scheduled_date.nil?
  end
  
end
