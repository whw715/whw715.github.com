#encoding: utf-8
class Film < ActiveRecord::Base
  attr_accessible :category, :country, :description, :director, :length, :time, :title
  has_many :actors
  has_many :tickets

  validates_presence_of :title, :message => "电影标题不能为空"

  
end
