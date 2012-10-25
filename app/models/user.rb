class User < ActiveRecord::Base
  attr_accessible :email, :username, :name, :bio, :fb_profile, :twitter_profile
end
