class AddUserIdToMusings < ActiveRecord::Migration
  def change
      add_column(:musings, :user_id, :integer)
  end
end
