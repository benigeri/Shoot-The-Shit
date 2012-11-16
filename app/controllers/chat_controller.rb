class ChatController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_globals

  def set_globals
    @secondary_navbar = true
    @highlight_chat = true
    @chat_title = true
  end

  def index
    @global_navbar = true
  end

  def show
    @chat_view = true
    @back_button = true
    @back_link = "/chat"
  end
end