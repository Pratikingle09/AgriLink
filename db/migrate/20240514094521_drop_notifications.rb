class DropNotifications < ActiveRecord::Migration[7.1]
  def change
    drop_table :notifications
  end
end
