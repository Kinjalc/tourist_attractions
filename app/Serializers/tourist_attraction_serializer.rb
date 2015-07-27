class TouristAttractionSerializer < ActiveModel::Serializer
  attributes :name, :description, :category, :id,:reviews_average,:latitude,:longitude
  has_many :reviews
end
