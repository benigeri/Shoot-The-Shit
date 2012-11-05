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
    @oldVote = current_user.votes.where(:musing_id => params[:vote][:musing_id]).first
    @vote = @oldVote ||  current_user.votes.create(params[:vote])
    @vote.update_attributes(:up => params[:vote][:up])

    @musing = Musing.where(:id => @vote.musing_id).first
    if !(@oldVote)
      if (@vote.up)
        @musing.votecount += 1
      else
        @musing.votecount -= 1
      end
      @musing.save
    else
      if @vote.up
        if (@oldVote.up)
          @musing.votecount += 2
        end
      else
        if !(@oldVote.up)
          @musing.votecount -= 2
        end
      end
      @musing.save
    end
    redirect_to :back
  end

end


