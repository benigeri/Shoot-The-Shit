class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_timezone

  def show
  end

  def new
  end

  def create
    @comment = current_user.comments.create(params[:comment])
    if @comment.save
      flash[:notice] = "Comment successfully created."
    else
      flash[:notice] = "Could not create a blank comment."
    end

    redirect_to :back
  end

end
