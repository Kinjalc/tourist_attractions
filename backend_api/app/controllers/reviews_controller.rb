class ReviewsController < ApplicationController
  before_action :set_tourist_attraction
  def index
    @reviews = @tourist_attraction.reviews
    render json: @reviews
  end

  def create
    @review_tourist_attraction = @tourist_attraction.reviews.build(review_params)
    if @review_tourist_attraction.save
      render json: @review_tourist_attraction, status: :created
    else
      render json: @review_tourist_attraction.errors, status: :unprocessable_entity
    end
  end

  def show
    @review = @tourist_attraction.tourist_attractions.find(params[:review_id])
    render json: @review
  end

  def update
    @review = @tourist_attraction.tourist_attractions.find(params[:review_id])
    if @review.update(review_params)
      head :no_content
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @review = @tourist_attraction.tourist_attractions.find(params[:review_id])
    @review.destroy

    head :no_content
  end

  private
   def review_params
    params.require(:review)
      .permit(:name, :comments, :rating, :user_id)
  end

  def set_tourist_attraction
   @tourist_attraction = TouristAttraction.find(params[:id])
  end
end
