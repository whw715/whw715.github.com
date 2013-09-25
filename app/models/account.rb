#encoding: utf-8
class Account < ActiveRecord::Base
  attr_accessible :balance, :email, :password,:password_confirmation, :score, :username
  has_secure_password
  has_many :orders
  validates_uniqueness_of :username, :message => "用户名已存在"
  validates_length_of :password, :minimum => 8, :message => "密码太短，至少为8位"
  validates_format_of  :email, :message => "邮箱格式不正确!", :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i  


end
