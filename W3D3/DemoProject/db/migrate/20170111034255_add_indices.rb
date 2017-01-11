class AddIndices < ActiveRecord::Migration
  def change
    add_column :people, :house_id, :integer
  end
end
