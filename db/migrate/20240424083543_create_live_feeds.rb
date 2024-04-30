class CreateLiveFeeds < ActiveRecord::Migration[7.1]
  def change
    create_table :live_feeds do |t|
      t.string :title
      t.text :question_body
      t.integer :asked_by

      t.timestamps
    end
  end
end
