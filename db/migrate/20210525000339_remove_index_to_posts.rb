class RemoveIndexToPosts < ActiveRecord::Migration[6.0]
  def change
    remove_index :posts, [:user_id, :group_id]
    add_index :posts, [:user_id, :group_id]
  end
end
