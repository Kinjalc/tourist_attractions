class TouristAttractionSerializer < ActiveModel::Serializer
  attributes :name, :description, :category, :id,:reviews_average
  has_many :reviews
end
