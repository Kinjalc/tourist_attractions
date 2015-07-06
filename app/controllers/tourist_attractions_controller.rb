class TouristAttractionsController < ApplicationController
  def index
    @city = City.find(params[:city_id])
    @tourist_attractions = @city.tourist_attractions
    render json: @tourist_attractions
  end

  def create
    @city = City.find(params[:city_id])
    @tourist_attraction = @city.tourist_attractions.build(tourist_attraction_params)
    if @tourist_attraction.save
      render json:@tourist_attraction, status: :created, location: tourist_attraction_url
    else
      render json: @tourist_attraction.errors, status: :unprocessable_entity
    end
  end

  def nearby_attractions
    @tourist_attraction = TouristAttraction.find(params[:id])
    @origin = [@tourist_attraction.latitude,@tourist_attraction.longitude]
    logger.info @origin
    @nearby_attr = TouristAttraction.find_nearby_attractions @origin
    render json: @nearby_attr
  end

  def show
    @city = City.find(params[:city_id])
    @tourist_attraction = @city.tourist_attractions.find(params[:id])
    render json: @tourist_attraction
  end

  def update
    @city = City.find(params[:city_id])
    @tourist_attraction = @city.tourist_attractions.find(params[:id])
    if @tourist_attraction.update(tourist_attraction_params)
      head :no_content
    else
      render json: @tourist_attraction.errors, status: :unprocessable_entity
    end
  end

  # destroy  /movies/:id(.delete just deletes an object  but .destroy deletes objects and associated routes)
  def destroy
    @city = City.find(params[:city_id])
    @tourist_attraction = @city.tourist_attractions.find(params[:id])
    @tourist_attraction.destroy

    head :no_content
  end

  private
   def tourist_attraction_params
    params.require(:tourist_attraction)
      .permit(:name, :description, :category, :latitude, :longitude)
  end
end
