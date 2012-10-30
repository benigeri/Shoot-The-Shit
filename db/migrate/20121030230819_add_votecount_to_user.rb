class AddVotecountToUser < ActiveRecord::Migration
  def change
    add_column(:musings, :votecount, :integer, :default => 0)
  end
end
