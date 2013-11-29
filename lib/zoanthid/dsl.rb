require 'cetacean'
require 'faraday'

module Zoanthid::DSL
  def document
    browser.document
  end

  def browser
    @browser ||= Zoanthid::Browser.new
  end

  def expand_link(rel, expansions={})
    document.get_uri(rel).expand(expansions)
  end

  def clear_history!
    browser.clear_history!
  end

  Zoanthid::Browser::REQUEST_METHODS.each do |verb|
    define_method verb do |*args, &block|
      args[0] = '/' if args.first == :root

      browser.send verb, *args, &block
    end
  end
end
