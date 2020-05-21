class PlannedMealsController < ApplicationController

  def new
    if @recipe = Recipe.find_by_id(params[:recipe_id])
      @planned_meal = @recipe.planned_meals.build
    else
      @planned_meal = PlannedMeal.new
    end
  end

  def create
    @planned_meal = PlannedMeal.new(planned_meal_params)
    @planned_meal.planner = current_user
    if @planned_meal.save
      redirect_to recipes_path
    else
      render :new
    end
  end

  def index
  end

  private

  def planned_meal_params
    params.require(:planned_meal).permit(:recipe_id, :date, :meal_type)
  end

end
