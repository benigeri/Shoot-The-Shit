class VotesController < ApplicationController
  before_filter :authenticate_user!

  def index
    redirect_to :back
  end

  def show
  end

  def new
  end

  def create
    @vote = current_user.votes.where(:musing_id => params[:vote][:musing_id]).first ||  current_user.votes.create(params[:vote])
    @vote.update_attributes(:up => params[:vote][:up])

    @musing = Musing.where(:id => @vote.musing_id).first

    if @vote.up
      @musing.votecount += 1
      @musing.save
    else
      @musing.votecount -= 1
      @musing.save
    end
    redirect_to :back
  end

end
