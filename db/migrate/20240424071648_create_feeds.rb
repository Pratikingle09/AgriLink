class CreateFeeds < ActiveRecord::Migration[7.1]
  def change
    create_table :feeds do |t|
      t.string :question_title
      t.text :question_body
      t.integer :question_asked_by

      t.timestamps
    end
  end
end
