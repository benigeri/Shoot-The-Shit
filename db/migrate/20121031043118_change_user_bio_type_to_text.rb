class ChangeUserBioTypeToText < ActiveRecord::Migration
  def up
    change_column(:users, :bio, :text)
  end

  def down
    change_column(:users, :bio, :string)
  end
end
