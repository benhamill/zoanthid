# Zoanthid [![Build Status](https://travis-ci.org/benhamill/zoanthid.png)](https://travis-ci.org/benhamill/zoanthid) [![Code Climate](https://codeclimate.com/github/benhamill/zoanthid.png)](https://codeclimate.com/github/benhamill/zoanthid)

Zoanthids are [a kind of coral](http://en.wikipedia.org/wiki/Zoantharia) that is
very robust.

Zoanthid is a library that interfaces with Rails and RSpec to help you write
expressive tests for your [HAL](http://stateless.co/hal_specification.html) API.
It uses [Cetacean](https://github.com/benhamill/cetacean#readme) and
[Faraday](https://github.com/lostisland/faraday#readme) to make the requests and
deal with the responses. It's not configurable at this juncture.

## Usage

This will most likely change, but here's the idea so far:

Require Zoanthid in your spec_helper.rb, then if you put spec files in
`spec/api/`, or label them with `type: :api` and you'll get some helpers.

``` ruby
describe "listing posts" do
  before do
    get :root
    get expand_uri(:posts)
  end

  it "shows the total" do
    expect(document['total']).to eq(25)
  end

  it "has a next link" do
    expect(expand_uri(:next)).to eq('/posts?page=2')
  end

  it "can jump to any page" do
    expect(expand_uri(:jump_to_page, page: 99)).to eq('/posts?page=99')
  end

  it "embeds the posts" do
    expect(document.embedded(:posts).count).to eq(25)
  end
end
```

## The Future?

Possibly in the future, there might be nice matchers. I plan to add features
slowly, though, only in the face of an actual need.

## Contributing

Help is gladly welcomed. If you have a feature you'd like to add, it's much more
likely to get in (or get in faster) the closer you stick to these steps:

1. Open an Issue to talk about it. We can discuss whether it's the right
  direction or maybe help track down a bug, etc.
1. Fork the project, and make a branch to work on your feature/fix. Master is
  where you'll want to start from.
1. Turn the Issue into a Pull Request. There are several ways to do this, but
  [hub](https://github.com/defunkt/hub) is probably the easiest.
1. Make sure your Pull Request includes tests.
1. Bonus points if your Pull Request updates `CHANGES.md` to include a summary
   of your changes and your name like the other entries. If the last entry is
   the last release, add a new `## Unreleased` heading at the top.

If you don't know how to fix something, even just a Pull Request that includes a
failing test can be helpful. If in doubt, make an Issue to discuss.
