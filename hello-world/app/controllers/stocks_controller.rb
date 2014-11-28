require 'stock_quote'
require 'pp'

class StocksController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @stocks = Stock.where(user_id: @user.id)
    @stocks.each do |stock|
      refresh(stock)
    end
  end
  def create
    @user = User.find(params[:user_id])
    symbol = params[:stock]["symbol"]
    @stock = Stock.new(convert(symbol, @user.id))
    if @stock.save!
      redirect_to user_stocks_path
    else
      redirect_to new_user_stock_path
    end
  end
  def show
    @user = User.find(params[:user_id])
    @stock = Stock.find(params[:id])
    refresh(@stock)
  end
  def update
    @stock = Stock.find(params[:id])
    refresh(@stock)
    redirect_to user_stock_path
  end
  def destroy
    @stock = Stock.find(params[:id])
    @stock.destroy
    redirect_to user_stocks
  end
  def convert(symbol, user_id)
    quote = StockQuote::Stock.quote(symbol)
    pp quote
    hashed_quote = { :last_price => quote.last_trade_price_only,
                     :days_high  => quote.days_high,
                     :days_low   => quote.days_low,
                     :market_cap => quote.market_capitalization,
                     :name       => quote.name,
                     :symbol     => quote.symbol,
                     :volume     => quote.volume,
                     :user_id    => user_id
    }
  end
  def refresh(stock)
    quote = StockQuote::Stock.quote(stock.symbol)
    hashed_quote = { :last_price => quote.last_trade_price_only,
                     :days_high  => quote.days_high,
                     :days_low   => quote.days_low,
                     :market_cap => quote.market_capitalization,
                     :volume     => quote.volume,
    }
    stock.update_attributes(hashed_quote)
  end
  def toJS
    user = User.find(params[:user_id])
    stocks = Stock.where(user_id: user.id)
    render json: stocks
  end
end
