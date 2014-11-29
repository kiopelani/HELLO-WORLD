require 'pp'
require 'nokogiri'
require 'open-uri'
require 'restclient'

class SportsController < ApplicationController
  def index
  end
end

page = Nokogiri::HTML(RestClient.get("http://scores.espn.go.com/nfl/scoreboard"))
pp page
