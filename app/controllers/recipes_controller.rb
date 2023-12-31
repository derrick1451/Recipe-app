class RecipesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:toggle_public]

  def index
    @recipes = current_user.recipes
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    @recipe_foods = @recipe.foods.includes(:recipe_foods)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save
      redirect_to recipes_path, notice: 'Recipe created successfully!'
    else
      flash[:alert] = 'Recipe could not be created'
      render :new
    end
  end

  def destroy
    @recipe = current_user.recipes.find_by(id: params[:id])

    if @recipe.destroy
      redirect_to recipes_path, notice: 'Recipe deleted successfully!'
    else
      redirect_to recipes_path, alert: 'Error: Recipe could not be deleted'
    end
  end

  def toggle_public
    @recipe = Recipe.find_by(id: params[:id])
    new_public_state = !@recipe.public
    if @recipe.update(public: new_public_state)
      respond_to do |format|
        format.html { redirect_to recipe_path(@recipe), notice: 'Recipe public status updated successfully!' }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to recipe_path(@recipe), alert: 'Error: Recipe public status could not be updated' }
        format.js
      end
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
