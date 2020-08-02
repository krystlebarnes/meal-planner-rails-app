class PlannedMealsController < ApplicationController

  def index
    if @planner = User.find_by_id(params[:user_id])
      @planned_meals = @planner.planned_meals
      params[:start_date] && !params[:start_date].empty? ? (@start_date = params[:start_date].to_date) : (@start_date = Date.today)
      @day_2 = @start_date + 1.day
      @day_3 = @start_date + 2.days
      @day_4 = @start_date + 3.days
      @day_5 = @start_date + 4.days
      @day_6 = @start_date + 5.days
      @day_7 = @start_date + 6.days
      @day_8 = @start_date + 7.days
      @day_9 = @start_date + 8.days
      @day_10 = @start_date + 9.days
      @day_11 = @start_date + 10.days
      @day_12 = @start_date + 11.days
      @day_13 = @start_date + 12.days
      @end_date = @start_date + 13.days
      @planned_meals = @planner.planned_meals.meal_plan(@start_date, @end_date)
    else
      redirect_to root_path
    end

  end
  
  def new
    if @recipe = Recipe.find_by_id(params[:recipe_id])
      @planned_meal = @recipe.planned_meals.build
    else
      @planned_meal = PlannedMeal.new
      @recipes = Recipe.alpha
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

  private

  def planned_meal_params
    params.require(:planned_meal).permit(:recipe_id, :date, :meal_type)
  end

end
