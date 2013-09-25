class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :film_id
      t.datetime :time
      t.integer :room
      t.integer :colume
      t.integer :row
      t.decimal :price
      t.boolean :onsale

      t.timestamps
    end
  end
end
