class RenameLiveFeedIdColumnInAnswers < ActiveRecord::Migration[7.1]
  def change
    remove_index :answers, name: 'index_answers_on_live_feed_id'
    rename_column :answers, :Live_Feed_id, :live_feed_id
    add_index :answers, :live_feed_id
  end
end
