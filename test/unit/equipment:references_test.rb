require 'test_helper'

class Equipment:referencesTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Equipment:references.new.valid?
  end
end
