class VotesController < ApplicationController
  before_filter :authenticate_user!

  def show
  end

  def new
  end

  def create
    @vote = current_user.votes.where(:musing_id => params[:vote][:musing_id]).first
    @vote ||= current_user.votes.create(params[:vote])
    @vote.update_attributes(:up => params[:vote][:up])
    redirect_to :back
  end

end
