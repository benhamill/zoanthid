require 'cetacean'
require 'faraday'

module Zoanthid::DSL
  def app
    Zoanthid.app
  end

  def client
    @client ||= Faraday.new do |client|
      client.adapter :rack, app
      client.headers['Accept'] = 'application/hal+json'
    end
  end

  %w(get post put delete head patch).each do |verb|
    define_method verb do |*args, &block|
      Cetacean.new(client.send verb, *args, &block)
    end
  end
end
