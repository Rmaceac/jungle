class Admin::DashboardController < ApplicationController
  before_filter :authenticate
  
  def show
    @products_count = Product.count(:all)
    @categories_count = Category.count(:all)
  end

  protected
    def authenticate 
      authenticate_or_request_with_http_basic do |username, password|
      username == ENV['USERNAME'] && password == ENV['PASSWORD']
      end
    end

end
