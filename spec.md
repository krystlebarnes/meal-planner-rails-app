# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
    - as specified in Gemfile
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
    - Recipe has_many Ingredients
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
    - Instruction belongs_to Recipe
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
    - Planner has_many Recipes through PlannedMeals
    - Item has_many Recipes through Ingredients
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
    - Planner has_many Recipes through PlannedMeals, Recipe has_many Planners through PlannedMeals
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
    - planned_meals.date
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    - Ingredient, Item, PlannedMeal, Recipe, User have validatons
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    - PlannedMeal.meal_plan (User.planned_meals.meal_plan) URL: users/:user_id/planned_meals
- [x] Include signup (how e.g. Devise)
    - signup route, bcrypt
- [x] Include login (how e.g. Devise)
    - login route, bcrypt
- [x] Include logout (how e.g. Devise)
    - logout route
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
    - Omniauth (Google)
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
    - users/:user_id/recipes
    - users/:user_id/planned_meals
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
    - recipes/:user_id/planned_meals/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
    - /recipes/new

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
