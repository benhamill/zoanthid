require 'spec_helper'
require 'zoanthid'

describe Zoanthid, type: 'api' do
  before do
    Zoanthid.app = TestApp
  end

  let(:document) do
    get '/'
  end

  it "gets the right document" do
    expect(document.get_uri(:self)).to eq('/')
  end
end
