# vim: set et sts=2 sw=2 ts=2 ft=ruby :
class V6hackController < ApplicationController
  def index
    tweet_id = addr2int(request.host)
    @tweet = Tweet.new(tweet_id).get
  end

  def post
    ch = addr2int(request.host)
    @tweet = Tweet.new(ch).post
  end

  def color
    int = addr2int(request.host)
    @tweet = Tweet.new(int).color
  end

  private
  def addr2int(addr)
    tweet_addr = addr.split(%r!2001:2e8:406:11::?!).last.chop
    tweet_addr.split(':').join.to_i(16)
  end
end
