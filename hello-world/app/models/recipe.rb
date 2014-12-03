class Recipe < ActiveRecord::Base
  include HTTParty

  def self.get_recipe
    select_type = ["beef", "chicken", "pork", "potato"].sample
    @response = HTTParty.get("http://food2fork.com/api/search?key=db47d542c7e6273e08f0b1a248c5cee1&q=shredded%20#{select_type}")
    body = JSON.parse(@response.body)
    # food = body["recipes"].sample
    # @title = food["title"]
    # @f2f_url = food["recipes"]
    # @image_url = food["image_url"]
  end


end