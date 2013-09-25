class Actor < ActiveRecord::Base
  attr_accessible :film_id, :name
  belongs_to :film
end
