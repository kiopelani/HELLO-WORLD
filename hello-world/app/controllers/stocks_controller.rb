require 'stock_quote'
require 'pp'

class StocksController < ApplicationController
  before_action       :load_user
  skip_before_filter  :verify_authenticity_token

  def index
    update_stocks
  end
  def update_stocks
    @stock_symbols.each do |symbol|
      @stocks << StockQuote::Stock.quote(symbol, nil, nil,
        [ "Symbol",
          "Name",
          "DaysHigh",
          "DaysLow",
          "LastTradePriceOnly",
          "MarketCapitalization",
          "Volume"] )
    end
  end
  def add
    stock = Stock.new(user_id: @user.id, symbol: params["symbol"])
    respond_to do |format|
      if stock.save
        format.js { render json: stock }
      else
        puts "you failed"
      end
    end
  end
  def destroy
    stock = Stock.find_by(user_id: @user.id, symbol: params["symbol"])
    respond_to do |format|
      if stock.destroy
        format.js { render json: stock }
      end
    end
  end
  def endpoint
    update_stocks
    render json: @stocks
  end
  private
    def load_user
      @user = current_user
      @stocks = []
      @stock_symbols = []
      @user.stocks.each do |stock|
        @stock_symbols << stock.symbol
      end
    end
end

