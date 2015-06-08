class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :comments
      t.integer :rating
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :tourist_attraction, index: true, foreign_key: true
    end
  end
end
