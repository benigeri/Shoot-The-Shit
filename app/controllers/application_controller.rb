class ApplicationController < ActionController::Base
  protect_from_forgery
    before_filter :set_globals
  def set_globals
    @secondary_navbar = false
    @pillbox_sorter = false
    @highlight_musings = false
    @global_navbar = true
  end
  def set_timezone
    Time.zone =  'Pacific Time (US & Canada)'
  end
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
