require 'spec_helper'
require 'zoanthid'

describe Zoanthid, type: 'api' do
  before do
    Zoanthid.app = TestApp

    get :root
  end

  it "handles GETs" do
    expect(document['get_root']).to eq('get root')
  end

  it "can extract URIs" do
    expect(expand_link(:posts)).to eq('/posts')
  end

  it "can expand URIs" do
    expect(expand_link(:posts, page: 2)).to eq('/posts?page=2')
  end

  context "following a rel" do
    before do
      get expand_link(:posts)
    end

    it "ends up on the right document" do
      expect(document['posts']).to eq('posts')
    end
  end

  context "in a different context" do
    it "forgets the document from another context" do
      expect(document['get_root']).to eq('get root')
    end
  end
end
