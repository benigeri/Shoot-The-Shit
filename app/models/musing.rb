class Musing < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible: title, content
  has_many: comments, votes
  belongs_to: user
end
