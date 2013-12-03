require 'zoanthid'
require 'rspec/core'

RSpec.configure do |config|
  config.include(
    Zoanthid::ExampleGroup,
    type: :api,
    example_group: ->(example_group, metadata) do
      (metadata[:type].nil? || metadata[:type] == :request) && config.escaped_path(%w[spec api]) =~ example_group[:file_path]
    end
  )

  config.include Zoanthid::DSL, type: :api

  config.after do
    if self.class.include?(Zoanthid::DSL)
      clear_history!
    end
  end
end
