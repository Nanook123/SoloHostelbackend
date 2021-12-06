class AddFriendidToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :friend_id, :integer
  end
end
