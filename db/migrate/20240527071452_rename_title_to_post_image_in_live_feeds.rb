class RenameTitleToPostImageInLiveFeeds < ActiveRecord::Migration[7.1]
  def change
    rename_column :live_feeds, :title, :post_image
  end
end
