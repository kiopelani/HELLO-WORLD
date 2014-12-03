require 'pp'

class JokeController < ApplicationController
  include HTTParty
  def index
    response = HTTParty.get("http://api.icndb.com/jokes/random")
    @joke = response["value"]["joke"]
    pp @joke
  end
end