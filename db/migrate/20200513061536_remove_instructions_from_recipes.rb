class RemoveInstructionsFromRecipes < ActiveRecord::Migration[6.0]
  def change

    remove_column :recipes, :instructions, :string
  end
end
