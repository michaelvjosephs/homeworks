class ChangeUserIdToInteger < ActiveRecord::Migration
  def change
    remove_column :cats, :user_id
    add_column :cats, :user_id, :integer
    Cat.all.update_all(user_id: 1)
    change_column :cats, :user_id, :integer, null: false
  end
end
