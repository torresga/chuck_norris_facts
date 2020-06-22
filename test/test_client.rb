require 'minitest/autorun'

require_relative '../lib/client.rb'
require_relative '../lib/joke.rb'

class TestClient < Minitest::Test
  def setup
    @client = ChuckNorrisClient.new
  end

  def test_client
    assert(@client)
  end

  def test_client_instance_of_chuckNorrisClient
    assert_instance_of(ChuckNorrisClient, @client)
  end

  def test_random_joke_is_a_joke_object
    assert_instance_of(Joke, @client.get_random_joke)
  end

  def test_jokes_are_random
    joke1 = @client.get_random_joke
    joke2 = @client.get_random_joke

    refute_equal(joke1, joke2)
  end

  def test_random_joke_from_category_is_a_joke
    category = 'fashion'
    assert_instance_of(Joke, @client.get_random_joke_from_category(category))
  end

  def test_random_joke_from_category_includes_category
    category = 'dev'
    assert_includes(@client.get_random_joke_from_category(category).categories, category)
  end

  def test_random_joke_from_category_is_random
    category = 'dev'
    joke1 = @client.get_random_joke_from_category(category)
    joke2 = @client.get_random_joke_from_category(category)

    refute_equal(joke1, joke2)
  end

  def test_get_categories_returns_array
    assert_instance_of(Array, @client.get_categories)
  end

  def test_search_text_returns_array
    word = 'beer'
    assert_instance_of(Array, @client.search_text(word))
  end

  def test_search_text_returns_an_array_of_jokes
    word = 'beer'
    all_jokes = @client.search_text(word).all? do |joke|
      joke.instance_of?(Joke)
    end

    assert_equal(true, all_jokes)
  end
end
