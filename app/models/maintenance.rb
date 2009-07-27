class Maintenance < ActiveRecord::Base
  STATUSES = %w(accepted refused pending complete)
  SERVICE_TYPES = %w(ordinario straordinario)
  
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

  def status
    if accepted
      if completed
        return "complete"
      else
        return "pending"
      end
    elsif not accepted
      return "refused"
    end
  end
end
