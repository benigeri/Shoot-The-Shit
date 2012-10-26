class CreateMusings < ActiveRecord::Migration
  def change
    create_table :musings do |t|
      t.string :title
      t.string :content
      # add location here later with geocoder gem
      t.timestamps
    end
  end
end
