#encoding: utf-8
class SessionsController < ApplicationController
	def new
	end

	def create
		account = Account.find_by_username(params[:name])
		if account and account.authenticate(params[:password])
			session[:account_id]       = account.id
			session[:account_username] = account.username
			redirect_to show_now_url
		else
			redirect_to login_url, alert: "用户名/密码错误" 
		end
	end

	def destroy
    session[:account_id]       = nil
    session[:account_username] = nil
    session[:admin_id]         = nil
    redirect_to index_url
  end

  def admin_new
  end

  def admin_create
    admin = Administrator.find_by_username(params[:name])
    if admin and admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to show_now_url
    else
      redirect_to admin_login_url, alert: "用户名/密码错误" 
    end
  end

  def authorize
    
  end
end
