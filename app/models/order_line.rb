class OrderLine < ActiveRecord::Base
  attr_accessible :order_id, :ticket_id
  belongs_to :order
  belongs_to :ticket
end
