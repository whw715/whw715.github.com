class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :account_id
      t.datetime :time
      t.decimal :price

      t.timestamps
    end
  end
end
