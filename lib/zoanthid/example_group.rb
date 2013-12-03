module Zoanthid
  module ExampleGroup
    DEFAULT_HOST = "www.example.com"

    def self.included(base)
      base.metadata[:type] = :api

      if base.respond_to?(:default_url_options)
        base.default_url_options[:host] ||= Zoanthid::ExampleGroup::DEFAULT_HOST
      end
    end
  end
end
