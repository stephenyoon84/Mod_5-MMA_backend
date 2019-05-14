class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.bigint :phone_number
      t.string :gender
      t.date :dob
      t.date :register_date
      t.boolean :active
      t.text :info
      t.string :user_type, :default => "team"
      t.string :password_digest

      t.timestamps
    end
  end
end
