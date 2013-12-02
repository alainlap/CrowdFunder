class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.integer :project_id
      t.integer :dollar_amount
      t.integer :tier_id

      t.timestamps
    end
  end
end
