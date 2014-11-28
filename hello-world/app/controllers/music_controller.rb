class MusicController < ApplicationController
  include HTTParty

  def index
  end

  def begin_spotify_authentication
    client_id = ENV['CLIENT_ID']
    redirect_uri = 'http://localhost:3000/dashboard/music/spotify_authenticate'
    scope = 'playlist-read-private'
    response = HTTParty.get('GET https://accounts.spotify.com/authorize/?client_id=#{client_id}&response_type=code&redirect_uri=#{redirect_uri}&scope=#{scope}')
  end

  def spotify_authenticate

  end
end
