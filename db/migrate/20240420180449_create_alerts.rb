class CreateAlerts < ActiveRecord::Migration[7.1]
  def change
    create_table :alerts do |t|
      t.text :alert
      t.string :title

      t.timestamps
    end
  end
end
