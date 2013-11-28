module Zoanthid
  module ExampleGroup
    DEFAULT_HOST = "www.example.com"

    def included(base)
      metadata[:type] = :api

      if respond_to?(:default_url_options)
        default_url_options[:host] ||= Zoanthid::ExampleGroup::DEFAULT_HOST
      end
    end
  end
end
