class AddReviewsAvgToTouristAttraction < ActiveRecord::Migration
  def change
    add_column :tourist_attractions, :reviews_average, :float
  end
end
