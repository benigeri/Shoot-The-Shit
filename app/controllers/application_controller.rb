class ApplicationController < ActionController::Base
  protect_from_forgery
  def set_timezone
    Time.zone =  'Pacific Time (US & Canada)'
  end
end
