class CreateTouristAttractions < ActiveRecord::Migration
  def change
    create_table :tourist_attractions do |t|
      t.string :name
      t.text :description
      t.string :category
      t.decimal :latitude
      t.decimal :longitude
      t.references :city, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
