class ChatController < ApplicationController
  before_filter :authenticate_user!

  def index
  	@highlight_chat = true
  end
end