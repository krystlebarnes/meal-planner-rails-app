class PlannedMealsController < ApplicationController

  def new
    if @recipe = Recipe.find_by_id(params[:recipe_id])
      @planned_meal = @recipe.planned_meals.build
    else
      @planned_meal = PlannedMeal.new
    end
  end

  def index
  end

end
