class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :name
      t.string :bio
      t.string :fb_profile
      t.string :twitter_profile
      t.timestamps
    end
  end
end
