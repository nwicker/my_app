class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.float :amount
      t.datetime :datetime
      t.string :location
      t.integer :user_id
      t.float :account_balance_change

      t.timestamps

    end
  end
end
