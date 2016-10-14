module ApplicationHelper

  def get_employes
    User.where("user_type=?", "Employee").collect do |employe|
      ["#{employe.user_name}", employe.id] if employe.present?
    end
  end
end
