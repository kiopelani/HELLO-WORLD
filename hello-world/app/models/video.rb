class Video < ActiveRecord::Base
  include HTTParty

  def self.search
  animals = ["sloths", "pandas", "bunnies", "cats", "puppies", "alpacas", "slow+loris", "cute+owl"]
  animal = animals.sample
  @response = HTTParty.get("https://www.googleapis.com/youtube/v3/search?key=AIzaSyAGNb_uXPZ6TwsKjh2vz_G6G6wiP4HHqUc&part=id&type=video&q=#{animal}&maxResults=1")
    @video_link = @response["items"][0]["id"]["videoId"]
  end
end
