class VotesController < ApplicationController
  before_filter :authenticate_user!

  def index
    create
  end

  def show
  end

  def new
  end

  ##BUG: when revote, need to increment by 2 not 1
  def create
    @vote = current_user.votes.where(:musing_id => params[:vote][:musing_id]).first ||  current_user.votes.create(params[:vote])
    @vote.update_attributes(:up => params[:vote][:up])

    @musing = Musing.where(:id => @vote.musing_id).first

    if @vote.up
     if @musing.save
        @musing.votecount += 1
     end
    else
      if @musing.save
        @musing.votecount -= 1
      end
    end
    redirect_to :back
  end

end
