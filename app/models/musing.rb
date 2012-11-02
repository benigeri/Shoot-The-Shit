class Musing < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :title, :content, :voteCount
  # has_many :comments
  # has_many :votes
  belongs_to :user
  has_many :comments
  has_many :votes

  validates :title, :presence => true
  validates :content, :presence => true




end
