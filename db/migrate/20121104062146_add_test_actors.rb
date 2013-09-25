#encoding:utf-8
class AddTestActors < ActiveRecord::Migration
  def up
    Actor.delete_all

    Actor.create(
      :film_id => 1,
      :name => '杰瑞米·雷纳'
    ) 

    Actor.create(
      :film_id => 1,
      :name => '爱德华·诺顿'
    ) 
    Actor.create(
      :film_id => 1,
      :name => '蕾切尔·薇姿'
    )
  end

  def down
  end
end
