class ChangeMusingContentTypeToText < ActiveRecord::Migration
  def up
    change_column(:musings, :content, :text)
  end

  def down
    change_column(:musings, :content, :string)
  end
end
