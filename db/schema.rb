# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_03_23_163736) do

  create_table "ingredients", force: :cascade do |t|
    t.string "quantity"
    t.string "unit"
    t.string "notes"
    t.integer "item_id"
    t.integer "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_ingredients_on_item_id"
    t.index ["recipe_id"], name: "index_ingredients_on_recipe_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "planned_meals", force: :cascade do |t|
    t.date "date"
    t.string "meal_type"
    t.integer "recipe_id"
    t.integer "planner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["planner_id"], name: "index_planned_meals_on_planner_id"
    t.index ["recipe_id"], name: "index_planned_meals_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "prep_time"
    t.integer "cook_time"
    t.integer "serving_size"
    t.integer "calories"
    t.text "instructions"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_recipes_on_author_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ingredients", "items"
  add_foreign_key "ingredients", "recipes"
  add_foreign_key "planned_meals", "recipes"
  add_foreign_key "planned_meals", "users", column: "planner_id"
  add_foreign_key "recipes", "users", column: "author_id"
end
