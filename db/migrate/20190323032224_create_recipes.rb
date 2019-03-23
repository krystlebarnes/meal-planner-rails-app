class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :prep_time
      t.integer :cook_time
      t.integer :serving_size

      t.timestamps
    end
  end
end
