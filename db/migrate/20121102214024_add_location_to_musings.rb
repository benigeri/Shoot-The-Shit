class AddLocationToMusings < ActiveRecord::Migration
  def change
      add_column(:musings, :city, :string)
      add_column(:musings, :longitude, :float)
      add_column(:musings, :latitude, :float)
  end
end
