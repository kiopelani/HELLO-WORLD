require 'pp'
require 'nokogiri'
require 'open-uri'
require 'restclient'

class SportsController < ApplicationController
  def index
  end
  def endpoint
    all_scores = []
    away_scores = []
    away_teams = []
    away_team_gifs = []
    home_teams = []
    home_team_gifs = []

    yest_string = "#{Date.yesterday.year}#{Date.yesterday.month}#{Date.yesterday.day}"
    page = Nokogiri::HTML(RestClient.get("http://www.nba.com/gameline/#{yest_string}/"))
    scores_top = page.css('div.nbaModTopTeamNum')
    scores_top.each do |score|
      all_scores << score.text.to_i
    end
    away_scores = all_scores.values_at(* all_scores.each_index.select { |i| i.even? })
    home_scores = all_scores.values_at(* all_scores.each_index.select { |i| i.odd? })
    imgs_top = page.css('div.nbaModTopTeamAw img')
    imgs_top.each_with_index do |img, index|
      away_team_gifs << img.attributes["src"].value.gsub("12","").strip
      away_teams << img.attributes["title"].value
    end
    imgs_bot = page.css('div.nbaModTopTeamHm img')
    imgs_bot.each_with_index do |img, index|
      home_team_gifs << img.attributes["src"].value.gsub("12","").strip
      home_teams << img.attributes["title"].value
    end

    games_arr = []
    games_num = home_teams.count
    counter = 0
    games_num.times do
      games_arr <<Game.new({  "home_team" => home_teams[counter],
                              "away_team" => away_teams[counter],
                              "home_score" => home_scores[counter],
                              "away_score" => away_scores[counter],
                              "home_gif" => home_team_gifs[counter],
                              "away_gif" => away_team_gifs[counter]
      })
      counter += 1
    end
    render json: games_arr
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