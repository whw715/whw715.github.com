class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :title
      t.string :director
      t.string :country
      t.integer :length
      t.date :time
      t.text :description

      t.timestamps
    end
  end
end