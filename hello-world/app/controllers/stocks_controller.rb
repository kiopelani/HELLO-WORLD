require 'stock_quote'
require 'pp'

class StocksController < ApplicationController
  def initialize
    @stock_symbols = ["aapl", "goog", "fb", "crm", "atvi"]
  end
  def index
    @stocks = []
    update_stocks
  end
  def update_stocks
    p @stock_symbols
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
  def remove

  end
end
