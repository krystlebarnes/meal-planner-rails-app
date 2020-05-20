class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_login, only: [:index]

  def index
    if @author = User.find_by_id(params[:user_id])
      @recipes = @author.recipes
    else
      @recipes = Recipe.all
    end
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.author = current_user
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :prep_time, :cook_time, :serving_size, :calories, ingredients_attributes: [:_destroy, :id, :quantity, :unit, :item_name, :notes], instructions_attributes: [:_destroy, :id, :step])
  end

end
