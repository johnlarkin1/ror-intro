require 'httparty'

class Recipe
  include HTTParty

  base_uri 'http://food2fork.com/api'
  default_params key: ENV['FOOD2FORK_KEY']
  format :json

  def self.for term
    get("/search", query: {q: term})["recipes"]
  end
end

# What I've found from this example - it's really key to actually read the documentation on the website 
# I pretty much straight copied down what was in example 3.2.a Introduction to HTTParty and it screwed me up 
# for awhile. The issue? You need to have `query: {q: term}` rather than `query: {query: term}`. That 
# little tidbit is going to depend on the api that you're trying to utilize.