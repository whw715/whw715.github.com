class StoreController < ApplicationController
	public
	def index
	end

	def show_now
		@tmpfilms = Film.find(:all, :conditions => ["time < ?", Time.now])
    @films = []
    @tmpfilms.each do |f|
      can = false
      if f.tickets 
        f.tickets.each do |t|
          if t.time >= Time.now
            can = true
          end
        end
      end
      if can 
        @films << f
      end
    end

	end

	def show_after
		@films = Film.find(:all, :conditions => ["time > ?", Time.now])
	end

	def about
	end

  def authorize
  end
end
