require "zoanthid/version"
require "zoanthid/browser"
require "zoanthid/dsl"
require "zoanthid/example_group"

module Zoanthid
  def self.app
    @app
  end

  def self.app=(app)
    @app = app
  end
end
