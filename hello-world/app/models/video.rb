class Video < ActiveRecord::Base
  include HTTParty

  def self.search
  @response = HTTParty.get("https://www.googleapis.com/youtube/v3/search?key=AIzaSyAGNb_uXPZ6TwsKjh2vz_G6G6wiP4HHqUc&part=id&type=video&q=sloths&maxResults=1")
    @video_link = @response["items"][0]["id"]["videoId"]
  end
end
