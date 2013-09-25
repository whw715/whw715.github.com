class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.integer :score
      t.decimal :balance

      t.timestamps
    end
  end
end
