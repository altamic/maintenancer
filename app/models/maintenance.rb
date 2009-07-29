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
    lambda { |*args| { :conditions => ["scheduled_date_at < ?", (args.first || 3.months.ago)] } }
                                
  named_scope :pending, :conditions => { :accepted => true, :completed => false }                        
  named_scope :refused, :conditions => { :accepted => false, :completed => false }
  named_scope :executed, :conditions => { :accepted => true, :completed => true }
  named_scope :proposed, :conditions => { :accepted => nil }
  
  def name
    case status
    when "pending"
      return "#{status} maintenance scheduled on #{scheduled_date_at} for #{equipment_name} of #{client_name}"
    when "complete"
      return "#{status} maintenance on #{scheduled_date_at} for #{equipment_name} of #{client_name}"
    when "proposed"
      return "#{status} maintenance for #{equipment_name} of #{client_name}"
    when "refused"
      return "#{status} maintenance for #{equipment_name} of #{client_name}"
    end
  end
  
  def status
    if accepted
      if completed
        return "complete"
      else
        return "pending"
      end
    elsif accepted.nil?
      return "proposed"
    else
      return "refused"
    end
  end
end
