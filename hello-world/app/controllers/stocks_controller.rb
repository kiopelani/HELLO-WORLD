require 'stock_quote'
require 'pp'

class StocksController < ApplicationController
  before_action :load_user
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
        pp stock
        pp stock.to_json
        format.js { render json: stock }
      end
    end
    # if params[:commit].strip == "Add stock"
      # @stock_symbols << params[:stock][:symbol]
    # end
    # if params[:commit].strip == "Remove stock"
      # @stock_symbols.delete(params[:stock][:symbol])
    # end
    # update_stocks
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

