require 'minitest/autorun'
require 'json'

require_relative '../lib/joke.rb'

class TestJoke < Minitest::Test
  def setup
    joke_body = "{\"categories\":[],\"created_at\":\"2020-01-05 13:42:19.324003\",\"icon_url\":\"https://assets.chucknorris.host/img/avatar/chuck-norris.png\",\"id\":\"rznn9doosp6iowp0m5cblq\",\"updated_at\":\"2020-01-05 13:42:19.324003\",\"url\":\"https://api.chucknorris.io/jokes/rznn9doosp6iowp0m5cblq\",\"value\":\"On his birthday, Chuck Norris randomly selects one lucky child to be thrown into the sun.\"}"

    @joke = Joke.new(JSON.parse(joke_body))
  end

  def test_categories_returns_array
    assert_equal([], @joke.categories)
  end

  def test_created_at
    assert_equal("2020-01-05 13:42:19.324003", @joke.created_at)
  end

  def test_icon_url
    assert_equal("https://assets.chucknorris.host/img/avatar/chuck-norris.png", @joke.icon_url)
  end

  def test_id
    assert_equal("rznn9doosp6iowp0m5cblq", @joke.id)
  end

  def test_updated_at
    assert_equal("2020-01-05 13:42:19.324003", @joke.updated_at)
  end

  def test_url
    assert_equal("https://api.chucknorris.io/jokes/rznn9doosp6iowp0m5cblq", @joke.url)
  end

  def test_value
    assert_equal("On his birthday, Chuck Norris randomly selects one lucky child to be thrown into the sun.", @joke.value)
  end
end
