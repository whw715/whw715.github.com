#encoding: utf-8
class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery

  protected
  def authorize
    unless session[:admin_id]
      flash[:notice] = '请登录!'
      redirect_to index_url
    end
  end
end
