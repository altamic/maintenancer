module MaintenancesHelper
  def authorize
    current_user.nil?
    false
  end
end
