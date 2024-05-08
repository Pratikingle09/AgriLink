class ChangeTotalAmountColumnNameAndTypeInOrders < ActiveRecord::Migration[7.1]
  def change
    rename_column :orders, :total_amount, :mobile
    change_column :orders, :mobile, :string
  end
end
