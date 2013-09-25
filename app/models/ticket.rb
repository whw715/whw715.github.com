class Ticket < ActiveRecord::Base
  attr_accessible :colume, :film_id, :price, :room, :row, :time, :onsale
  belongs_to :film
  has_one :order_line

  validates_numericality_of :price
  validates_presence_of :price
  validates_presence_of :room


end
