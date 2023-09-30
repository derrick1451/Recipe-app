class FoodsController < ApplicationController
  before_action :authenticate_user!
  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
  end

  def create
    @user = current_user
    @food = @user.foods.new(food_params)
    if @food.save
      redirect_to foods_path
    else
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    if @food.destroy
      redirect_to foods_path, notice: 'food deleted successfully!'
    else
      redirect_to foods_path, alert: 'Error: food could not be deleted'
    end
  end

  def food_params
    params.require(:food).permit(:name, :price, :quantity, :measurement_unit)
  end
end
