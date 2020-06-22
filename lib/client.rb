require 'bundler/setup'
require 'net/http'
require 'json'

require_relative 'joke'

class ChuckNorrisClient
  def initialize
    @url = 'https://api.chucknorris.io/jokes'
  end

  def get_random_joke
    path = '/random'
    joke_body = Net::HTTP.get(URI(@url + path));

    Joke.new(JSON.parse(joke_body))
  end

  def get_random_joke_from_category(category)
    path = "/random?category=#{category}"
    joke_body = Net::HTTP.get(URI(@url + path));

    Joke.new(JSON.parse(joke_body))
  end

  def get_categories
    path = '/categories'

    JSON.parse(Net::HTTP.get(URI(@url + path)))
  end

  def search_text(query)
    uri = "https://api.chucknorris.io/jokes/search?query=#{query}"

    all_jokes = JSON.parse(Net::HTTP.get(URI(uri)))

    all_jokes['result'].map do |joke_body|
      Joke.new(joke_body)
    end
  end
end
