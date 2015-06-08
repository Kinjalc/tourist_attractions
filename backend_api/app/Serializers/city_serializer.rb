class CitySerializer < ActiveModel::Serializer
  attributes :name, :state, :country, :description, :id
  has_many :tourist_attractions
end
