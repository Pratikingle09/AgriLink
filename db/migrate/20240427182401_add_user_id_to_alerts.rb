class AddUserIdToAlerts < ActiveRecord::Migration[7.1]
  def change
    add_reference :alerts, :user, null: false, foreign_key: true
  end
end
