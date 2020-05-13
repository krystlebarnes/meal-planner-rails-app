class CreateInstructions < ActiveRecord::Migration[6.0]
  def change
    create_table :instructions do |t|
      t.string :step
      t.belongs_to :recipe, foreign_key: true

      t.timestamps
    end
  end
end
