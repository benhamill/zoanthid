module HALSpec
  module DSL
    def app
      ::Rails.application
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

  module ExampleGroup
    extend ActiveSupport::Concern

    DEFAULT_HOST = "www.example.com"

    included do
      metadata[:type] = :hal

      app = ::Rails.application
      if app.respond_to?(:routes)
        include app.routes.url_helpers     if app.routes.respond_to?(:url_helpers)
        include app.routes.mounted_helpers if app.routes.respond_to?(:mounted_helpers)

        if respond_to?(:default_url_options)
          default_url_options[:host] ||= ::HALSpec::ExampleGroup::DEFAULT_HOST
        end
      end
    end
  end
end

RSpec.configure do |config|
  config.include(
    HALSpec::ExampleGroup,
    type: :hal,
    example_group: ->(example_group, metadata) do
      metadata[:type].nil? && config.escaped_path(%w[spec hal]) =~ example_group[:file_path]
    end
  )

  config.include HALSpec::DSL, type: :hal
end
