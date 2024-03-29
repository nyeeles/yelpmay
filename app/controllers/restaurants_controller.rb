class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new restaurant_params

    if @restaurant.save
      redirect_to '/restaurants'
    else
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find params[:id]
  end

  def update
    @restaurant = Restaurant.find params[:id]
    @restaurant.update restaurant_params
    redirect_to '/restaurants'
  end

  def destroy
    @restaurant = Restaurant.find params[:id]
    @restaurant.destroy

    flash[:notice] = "Successfully deleted #{@restaurant.name}"
    redirect_to '/restaurants'
  end

  private

  def restaurant_params
    params[:restaurant].permit(:name, :cuisine)
  end
end
