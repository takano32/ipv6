class V6hackController < ApplicationController
  def index
    tweet_id = addr2int(request.host)
    @tweet = Tweet.new(tweet_id).get
  end

  def post
    ch = addr2int(request.host)
    @tweet = Tweet.new(ch).post
  end

  private
  def addr2int(addr)
    tweet_addr = addr.split('::').last
    tweet_addr.split(':').join.to_i(16)
  end
end
