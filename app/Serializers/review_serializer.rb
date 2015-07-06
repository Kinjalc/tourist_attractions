class ReviewSerializer < ActiveModel::Serializer
  attributes :comments, :rating, :user_name

  # belongs_to :tourist_attractions

  def user_name
    object.user.name
  end

end
