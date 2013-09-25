class AddTestTicket < ActiveRecord::Migration
  def up
    Ticket.delete_all

    for i in 1 .. 10 do
      for j in 1 .. 10 do
        Ticket.create(
          :film_id => 1,
          :time    => '2012-12-02 21:30',
          :room    => 1,
          :colume  => j,
          :row     => i,
          :price   => 70,
          :onsale  => true
        )
      end
    end

    for i in 1 .. 10 do
      for j in 1 .. 10 do
        Ticket.create(
          :film_id => 1,
          :time    => '2012-12-02 19:30',
          :room    => 1,
          :colume  => j,
          :row     => i,
          :price   => 85,
          :onsale  => true
        )
      end
    end

    for i in 1 .. 10 do
      for j in 1 .. 10 do
        Ticket.create(
          :film_id => 2,
          :time => '2012-12-01 10:10',
          :room => 1,
          :colume => i,
          :row => j,
          :price => 70,
          :onsale => true
        )
      end
    end

    for i in 1 .. 10 do
      for j in 1 .. 10 do
        Ticket.create(
          :film_id => 3,
          :time => '2012-12-21 21:20',
          :room => 1,
          :colume => i,
          :row => j,
          :price => 120,
          :onsale => true
        )
      end
    end

    
  end

  def down
  end
end
