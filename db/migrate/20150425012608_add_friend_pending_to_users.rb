class AddFriendPendingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :friend_pending, :text
  end
end
