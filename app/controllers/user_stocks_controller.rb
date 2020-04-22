class UserStocksController < ApplicationController

  def create 
    stock = Stock.get_stock_by_ticker_symbol(params[:ticker])
    
    if stock.blank?
      stock = Stock.new_lookup(params[:ticker])
      stock.save
    end

    @user_stock = UserStock.create(user: current_user, stock: stock)
    flash[:notice] = "Stock #{stock.name} was added Successfully toyour portfolio"
    redirect_to my_portfolio_path
  end 

end
