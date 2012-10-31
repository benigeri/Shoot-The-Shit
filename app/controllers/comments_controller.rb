class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_timezone

  def show
  end

  def new
  end

  def create
    @comment = current_user.comments.create(params[:comment])
    redirect_to :back
  end

end
