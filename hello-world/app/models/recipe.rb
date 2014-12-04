class Recipe < ActiveRecord::Base
  include HTTParty

  def self.get_recipe
    select_type = ["beef", "chicken", "pork", "potato"].sample
    api_key = ENV["FOOD2FORK_KEY"]
    @response = HTTParty.get("http://food2fork.com/api/search?key=#{api_key}&q=shredded%20#{select_type}")
    body = JSON.parse(@response.body)
  end

end