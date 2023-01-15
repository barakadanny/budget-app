class CreateJoinTableTransactionCategory < ActiveRecord::Migration[7.0]
  def change
    create_join_table :transactions, :categories do |t|
      t.index [:transaction_id, :category_id]
    end
  end
end
