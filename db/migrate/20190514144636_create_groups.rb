class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :year
      t.references :user, foreign_key: true
      t.text :info

      t.timestamps
    end
  end
end
