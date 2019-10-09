class CreateIdentities < ActiveRecord::Migration[5.2]
  def change
    create_table :identities do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end