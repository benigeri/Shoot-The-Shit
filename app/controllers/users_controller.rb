class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
    if @user == current_user
    	@highlight_profile = true
    else
    	@secondary_navbar = true
    	@back_button = true
    end
  end
end
