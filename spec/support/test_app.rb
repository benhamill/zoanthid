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
    if content_type == 'application/hal+json'
      body JSON.dump(body)
    end
  end

  get '/' do
    {
      _links: {
        self: { href: '/' },
        posts: { href: '/posts{?page}', templated: true }
      },
      get_root: 'get root'
    }
  end

  get '/posts' do
    {
      _links: { self: { href: '/posts' } },
      posts: 'posts'
    }
  end
end
