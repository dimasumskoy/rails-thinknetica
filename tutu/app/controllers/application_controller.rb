class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.admin?
      admin_root_path
    else
      search_path
    end
  end
end
