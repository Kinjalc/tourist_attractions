class City < ActiveRecord::Base
  has_many :tourist_attractions, dependent: :destroy
  has_many :reviews, through: :tourist_attraction
end
