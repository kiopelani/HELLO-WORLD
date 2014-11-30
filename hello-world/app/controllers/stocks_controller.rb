 require 'stock_quote'
require 'pp'

class StocksController < ApplicationController
  before_action :setup

  def index
    @stocks = []
    update_stocks
  end
  def update_stocks
    @stock_symbols.each do |symbol|
      @stocks << StockQuote::Stock.quote(symbol)
    end
  end
  def edit
    @stocks = []
    if params[:commit].strip == "Add stock"
      @stock_symbols << params[:stock][:symbol]
    end
    if params[:commit].strip == "Remove stock"
      @stock_symbols.delete(params[:stock][:symbol])
    end
    update_stocks
    render action: "index"
  end
  def endpoint
    @stocks = []
    update_stocks
    render json: @stocks
  end
  private
    def setup
      @stock_symbols = ["aapl", "goog", "fb", "crm", "atvi"]
    end
end
