require 'net/http'
require 'json'
require_relative 'joke'

class ChuckNorrisClient
  # Since all of these methods are connecting from an internet source, let's use this as an excuse to use exceptions

  def self.get_random_joke
    # url: https://api.chucknorris.io/jokes/random
    # - Input: none
    # - Output: new Joke object

    uri = 'https://api.chucknorris.io/jokes/random'
    joke_body = Net::HTTP.get(URI(uri));

    Joke.new(JSON.parse(joke_body)).value
  end

  def self.get_random_joke_from_category(category)
    # url: https://api.chucknorris.io/jokes/random?category={category}
    # - Input: category
    # - Output: new Joke object's value

    uri = "https://api.chucknorris.io/jokes/random?category=#{category}"
    joke_body = Net::HTTP.get(URI(uri));

    Joke.new(JSON.parse(joke_body)).value
  end

  def self.get_categories
    # url: https://api.chucknorris.io/jokes/categories
    # - Input: None
    # - Output: an array of categories represented as strings

    uri = 'https://api.chucknorris.io/jokes/categories'

    Net::HTTP.get(URI(uri))
  end

  def self.search_text(query)
    # url: https://api.chucknorris.io/jokes/search?query={query}
    # - Input: a query
    # - Output: an array of new Joke objects

    uri = "https://api.chucknorris.io/jokes/search?query=#{query}"

    all_jokes = JSON.parse(Net::HTTP.get(URI(uri)))

    all_jokes['result'].map do |joke_body|
      Joke.new(joke_body)
    end
  end
end

puts ChuckNorrisClient.get_random_joke

puts ChuckNorrisClient.get_random_joke_from_category('dev');

puts ChuckNorrisClient.get_categories

ChuckNorrisClient.search_text('beer').each do |joke|
  puts "Joke info:"
  puts "Value: #{joke.value}"
  puts "Categories: #{joke.categories}"
  puts "Created at: #{joke.created_at}"
  puts "Icon url: #{joke.icon_url}"
  puts "Updated at: #{joke.updated_at}"
  puts "Url: #{joke.url}"
end
