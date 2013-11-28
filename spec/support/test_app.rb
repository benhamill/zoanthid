require 'sinatra/base'
require 'json'

class TestApp < Sinatra::Base
  configure do
    mime_type :hal, 'application/hal+json'
  end

  before do
    content_type :hal
  end

  after do
    if body == []
      body ''
    elsif content_type == 'application/hal+json'
      body JSON.dump(body)
    end
  end

  get '/' do
    {
      _links: { self: { href: '/' } }
    }
  end
end
