class Order < ActiveRecord::Base
  attr_accessible :account_id, :time, :price
  belongs_to :account
  has_many :order_lines

end
