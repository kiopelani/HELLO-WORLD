require 'pp'
require 'nokogiri'
require 'open-uri'
require 'restclient'

class SportsController < ApplicationController
  def index
  end
end

class Game
  def initialize(params={})
    @home_team  = params["home_team"]
    @away_team  = params["away_team"]
    @home_score = params["home_score"]
    @away_score = params["away_score"]
    @home_gif   = params["home_gif"]
    @away_gif   = params["away_gif"]
  end
end

def grab_scores
  all_scores = []
  away_scores = []
  away_teams = []
  away_team_gifs = []
  home_teams = []
  home_team_gifs = []

  # page = Nokogiri::HTML(RestClient.get("http://www.nba.com/gameline/20141128/"))
  # scores_top = page.css('div.nbaModTopTeamNum')
  # scores_top.each do |score|
  #   all_scores << score.text.to_i
  # end

  # away_scores = all_scores.values_at(* all_scores.each_index.select { |i| i.even? })
  # home_scores = all_scores.values_at(* all_scores.each_index.select { |i| i.odd? })

  page_top = Nokogiri::HTML(RestClient.get("http://www.nba.com/gameline/20141128/"))
  imgs_top = page_top.css('div.nbaModTopTeamAw img')
  # pp imgs_top[1].attributes["src"].value
  imgs_top.each_with_index do |img, index|
    # pp img
    # p "index is #{index}"
    # pp img.attributes["src"].value
    away_team_gifs << img.attributes["src"].value.gsub("12","").strip
    # away_teams << img.attributes["title"].value
  end

  pp away_team_gifs

  # page_bot = Nokogiri::HTML(RestClient.get("http://www.nba.com/gameline/20141128/"))
  # imgs_bot = page_bot.css('div.nbaModTopTeamHm img')
  # imgs_bot.each_with_index do |img, index|
  #   home_team_gifs << img.attributes["src"][index].value
  #   home_teams << img.attributes["title"][index].value
  # end

  # games_arr = []

  # pp home_teams
  # counter = 0
  # 3.times do
  #   p counter
  #   # p home_teams[counter]
  #   gamesies = Game.new({ "home_team" => home_teams[counter],
  #                       "away_team" => away_teams[counter],
  #                       "home_score" => home_scores[counter],
  #                       "away_score" => away_scores[counter],
  #                       "home_gif" => home_team_gifs[counter],
  #                       "away_gif" => away_team_gifs[counter]
  #   })
  #   counter += 1
  #   # pp gamesies
  # end
# pp away_scores
# pp home_scores
# pp away_teams
# pp away_team_gifs
# pp home_teams
# pp home_team_gifs
  # games_arr.each do |game|
  #   pp game
  # end
end

grab_scores




