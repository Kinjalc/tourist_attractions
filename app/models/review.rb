class Review < ActiveRecord::Base
  belongs_to :tourist_attraction
  belongs_to :user

  after_create :update_reviews

  def update_reviews
    attraction = self.tourist_attraction
    all_ratings = attraction.reviews.pluck(:rating)
    sum_ratings = all_ratings.sum

    avg_review = sum_ratings/all_ratings.size

    attraction.update_attribute(:reviews_average, avg_review)
  end
end
