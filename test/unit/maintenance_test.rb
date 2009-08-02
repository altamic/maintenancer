require 'test_helper'

class MaintenanceTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Maintenance.new.valid?
  end
  
  def test_change_scheduled_date_should_be_later_than_original
    original_date = 1.month.from_now
    m = Maintenance.new
    m.scheduled_date_at = original_date
    m.save
    changed_date  = 2.month.from_now
    assert_operator(changed_date, :m.scheduled_date_at>, m.scheduled_date_at)
  end
end
