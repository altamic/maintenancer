require 'test_helper'

class MaintenanceTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Maintenance.new.valid?
  end

end
