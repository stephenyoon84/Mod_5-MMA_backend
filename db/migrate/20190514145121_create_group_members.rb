class CreateGroupMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :group_members do |t|
      t.integer :group_id
      t.references :member, polymorphic: true, index: true

      t.timestamps
    end
  end
end
