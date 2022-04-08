class Admin::CategoriesController < ApplicationController
  before_filter :authenticate

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
  
  end


  protected
    def authenticate 
      authenticate_or_request_with_http_basic do |username, password|
      username == ENV['USERNAME'] && password == ENV['PASSWORD']
      end
    end

end
