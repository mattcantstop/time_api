class RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
    new_user_organization_path(current_user)
  end

end
