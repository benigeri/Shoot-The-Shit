class AddMusingIdAndUserIdToComments < ActiveRecord::Migration
  def change
    add_column(:comments, :user_id, :integer)
    add_column(:comments, :musing_id, :integer)
  end
end
