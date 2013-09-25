#encoding: utf-8
class ChooseController < ApplicationController
	public
  def show_ticket
    @film    = Film.find_by_id(params[:id])
		@tickets = @film.tickets
    @ticket_groups = @tickets.group_by{|t| t.time}
	end

  def show_seat
    @tickets = Ticket.find(:all,
                           :conditions => ["id>=:begin and id<=:end",params])
    @position = Array.new(11){Array.new(11,0)}
    @ticketids = Array.new(11){Array.new(11,0)}
    i = 0;
    @tickets.each do |ticket|
      @ticketids[ticket.row][ticket.colume] = ticket.id
      @position[ticket.row][ticket.colume] = ticket.onsale
    end
  end

  def ensure_order

    if params[:ids] == nil
      redirect_to :back, :alert => "请至少选择一张票"
    elsif session[:account_id] == nil
      redirect_to login_url, alert: "请先登录" 
    else
      @account = Account.find_by_id(session[:account_id])
      @sumprice = params[:ids].sum{|id| Ticket.find_by_id(id).price}


      if @account.score > 500 && @account.score <= 1000
        @sumprice *= 0.9
      elsif @account.score > 1000 && @account.score <=2000
        @sumprice *= 0.8
      elsif @account.score > 2000
        @sumprice *= 0.7
      end

      @can = true
      params[:ids].each do |id|
        @can &= Ticket.find_by_id(id).onsale
      end


      if @can == false
        redirect_to :back, :alert => "很不幸，您的票已经被购买，请重新购票"
      elsif @sumprice > @account.balance
        redirect_to :back, :alert => "账户余额不足"
      else
        @account.balance -= @sumprice
        @account.score += @sumprice
        @account.save(:validate => false)
        @order = @account.orders.create(:time=>Time.now,:price=>@sumprice);
        params[:ids].each do |id|
          @order.order_lines.create(:ticket_id=>id)
          @tmp = Ticket.find_by_id(id)
          @tmp.onsale=false
          @tmp.save
        end
        @account.orders<<@order
      end
    end
  end

  def authorize
  end
    
end
