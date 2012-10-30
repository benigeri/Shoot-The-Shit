class AddUserIdAddMusingIdAddUpToVotes < ActiveRecord::Migration
  def change
      add_column(:votes, :user_id, :integer)
      add_column(:votes, :musing_id, :integer)
      add_column(:votes, :up, :boolean)
  end
end
