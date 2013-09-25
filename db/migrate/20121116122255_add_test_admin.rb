class AddTestAdmin < ActiveRecord::Migration
  def up
    Administrator.delete_all
    Administrator.create(
      :username => 'admin',
      :password => 'admin'
    )

  end

  def down
  end
end
