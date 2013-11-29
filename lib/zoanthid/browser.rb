class Zoanthid::Browser
  REQUEST_METHODS = [:get, :post, :put, :delete, :head, :patch]

  def document
    history.last
  end

  def clear_history!
    @history = []
  end

  REQUEST_METHODS.each do |verb|
    define_method verb do |*args, &block|
      history << Cetacean.new(client.send verb, *args, &block)
    end
  end

  private

  def app
    Zoanthid.app
  end

  def client
    @client ||= Faraday.new do |client|
      client.adapter :rack, app
      client.headers['Accept'] = 'application/hal+json'
    end
  end

  def history
    @history ||= []
  end
end
