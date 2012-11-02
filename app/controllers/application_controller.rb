class ApplicationController < ActionController::Base
  protect_from_forgery
  def set_timezone
    Time.zone =  'Pacific Time (US & Canada)'
  end
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
