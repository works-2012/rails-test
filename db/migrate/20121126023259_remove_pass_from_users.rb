class RemovePassFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :pass
  end

  def down
  end
end
