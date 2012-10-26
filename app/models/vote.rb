class Vote < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to: musing, user

end
