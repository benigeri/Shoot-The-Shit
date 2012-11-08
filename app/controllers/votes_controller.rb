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
    @musing = Musing.where(:id => params[:vote][:musing_id]).first


    if @oldVote
      @oldVoteUp = @oldVote.up
      @newVoteUp = params[:vote][:up]
      if (@oldVoteUp == true)
        if (@newVoteUp != false)
          @musing.votecount -=2
          @oldVote.update_attributes(:up => false)
          @oldVote.save
          @musing.save
        end
      else
        if (@newVoteUp != true)
          @musing.votecount +=2
          @oldVote.update_attributes(:up => true)
          @oldVote.save;
          @musing.save
        end
      end
    else
      @vote = current_user.votes.create(params[:vote])
      if @vote.up
        @musing.votecount += 1
      else
        @musing.votecount -= 1
      end
    end
    @musing.save
    redirect_to :back
  end
end


