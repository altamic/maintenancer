module MaintenancesHelper
  def authorize(user)
    case user.role
    when "administrator"
    when "secretary"
    when "technician"
    when "client"
    when "provider"
    end
  end
end
