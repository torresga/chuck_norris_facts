require 'bundler/setup'

class Joke
  def initialize(body)
    @body = body
  end

  def categories
    @body['categories']
  end

  def created_at
    @body['created_at']
  end

  def id
    @body['id']
  end

  def icon_url
    @body['icon_url']
  end

  def updated_at
    @body['updated_at']
  end

  def url
    @body['url']
  end

  def value
    @body['value']
  end
end
