require 'pp'
require 'nokogiri'
require 'open-uri'
require 'restclient'

class WotdController < ApplicationController
  def index
    page = Nokogiri::HTML(RestClient.get("http://dictionary.reference.com/"))
    @wotd = {}
    @wotd[:word] = page.css(".wotd").text
    @wotd[:def] = page.css(".wotd_txt").text
  end
end
