class Owners::RestaurantsController < AdminController
  def index
    @restaurants = current_user.restaurants
  end

  def new
    @restaurant = current_user.restaurants.new
  end

  def create
    current_user.restaurants.create(restaurant_params)
    redirect_to owners_restaurants_path
  end

  private 

  def restaurant_params
    params.require(:restaurant).permit(:name)
  end
end