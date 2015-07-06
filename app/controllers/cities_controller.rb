class CitiesController < ApplicationController
  def index
    @cities = City.all
    render json: @cities
  end

  def create
    @city = City.new(city_params)
    if @city.save
      render json:@city, status: :created, location: cities_url
    else
      render json: @city.errors, status: :unprocessable_entity
    end
  end

  def show
    @city = City.find(params[:id])
    render json: @city
  end

  def update
    @city = City.find(params[:id])
    if @city.update(city_params)
      head :no_content
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # destroy  /movies/:id(.delete just deletes an object  but .destroy deletes objects and associated routes)
  def destroy
    @city = City.find(params[:id])
    @city.destroy

    head :no_content
  end

  private
   def city_params
    params.require(:city)
      .permit(:name, :state, :country, :description)
  end
end
