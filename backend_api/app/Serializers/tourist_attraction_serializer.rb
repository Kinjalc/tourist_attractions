class TouristAttractionSerializer < ActiveModel::Serializer
  attributes :name, :description, :category, :id
  has_many :reviews
end
