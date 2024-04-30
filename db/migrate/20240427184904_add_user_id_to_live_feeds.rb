class AddUserIdToLiveFeeds < ActiveRecord::Migration[7.1]
  def change
    add_reference :live_feeds, :user, null: false, foreign_key: true
  end
end
