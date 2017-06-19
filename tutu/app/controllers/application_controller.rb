class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.admin?
      flash[:notice] = "Hi, admin"
      admin_root_path
    else
      flash[:notice] = "Hi, #{current_user.first_name}"
      search_path
    end
  end
end
