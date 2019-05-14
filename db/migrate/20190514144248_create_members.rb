class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.bigint :phone_number
      t.string :gender
      t.date :dob
      t.date :register_date
      t.boolean :active
      t.text :info
      t.boolean :welcome_mail

      t.timestamps
    end
  end
end
