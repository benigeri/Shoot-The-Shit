class ChatController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_globals

  def set_globals
    @secondary_navbar = true
    @highlight_chat = true
    @global_navbar = true
  end

  def index
  end

  def show
  end
end