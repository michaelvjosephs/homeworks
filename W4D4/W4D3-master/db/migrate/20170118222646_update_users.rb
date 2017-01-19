class UpdateUsers < ActiveRecord::Migration
  def change
    add_column :cats, :user_id, :string
    Cat.all.update_all(user_id: 1)
    change_column :cats, :user_id, :string, null: false
    add_index :cats, :user_id
  end
end
