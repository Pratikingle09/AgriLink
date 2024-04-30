class ChangeAskedByDataTypeInAnswers < ActiveRecord::Migration[7.1]
  def change
      change_column :answers, :asked_by, :string
  end
end
