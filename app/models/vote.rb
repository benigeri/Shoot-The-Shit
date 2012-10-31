class Vote < ActiveRecord::Base
  attr_accessible :user_id, :musing_id, :up
  belongs_to :musing
  belongs_to :user
  validates :user_id, :uniqueness => { :scope => :musing_id }


end
