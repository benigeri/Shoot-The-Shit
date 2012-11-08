class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_globals

  def set_globals
    @secondary_navbar = true
    @global_navbar = true
  end

  def show
    @user = User.find(params[:id])
    if @user == current_user
    	@highlight_profile = true
    else
    	@back_button = true
    end
  end
end
