class Comment < ActiveRecord::Base
   attr_accessible :content, :user_id, :musing_id
  # attr_accessible :content
   belongs_to :musing
   belongs_to :user
end
