require 'pp'
require 'nokogiri'
require 'open-uri'
require 'restclient'

class UrbanwotdController < ApplicationController
  def index
    urban_page = Nokogiri::HTML(RestClient.get("http://www.urbandictionary.com/"))
    @urban_wotd = {}
    @urban_wotd[:word] = urban_page.css(".word")[0].text
    @urban_wotd[:def] = urban_page.css(".meaning")[0].text
    @urban_wotd[:example] = urban_page.css(".example")[0].text
    pp @urban_wotd
  end
end
