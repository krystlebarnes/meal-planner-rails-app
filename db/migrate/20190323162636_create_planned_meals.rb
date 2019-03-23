class CreatePlannedMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :planned_meals do |t|
      t.date :date
      t.string :meal_type
      t.belongs_to :recipe, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
