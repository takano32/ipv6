# vim: set sts=2 sw=2 ts=2 ft=ruby :
class Tweet
  require 'pit'
  require 'oauth'
  require 'rubytter'

  CONSUMER_KEY = 'sp0gUKPEBP7n8WULrrAS0w'
  CONSUMER_SECRET = 'h7UU66idNRfprnYacdOktyBlmaZijy0MXbwtDHqRM'

  def initialize(tweet_id)
    @tweet_id = tweet_id

    config = Pit.get("twitter",
                     :require => {
      'access_token' => 'oauth ACCESS_TOKEN',
      'access_token_secret' => 'oauth ACCESS_TOKEN_SERCTET',
    })

    @consumer = OAuth::Consumer.new(
      CONSUMER_KEY,
      CONSUMER_SECRET,
      :site => 'http://api.twitter.com'
    )

    @access_token = OAuth::AccessToken.new(
      @consumer,
      config['access_token'],
      config['access_token_secret']
    )
    @client = OAuthRubytter.new(@access_token)
  end

  def get
    @client.show(@tweet_id)
  end

  def post
    @client.update(@tweet_id.to_i.chr + " #llplanets #v6hack")
  end

	def color
		color = sprintf('#%06X', @tweet_id)[0...6]

    #cmd = %Q[curl -s -F imagedata=@- -F id=v6hack -H "Expect:" http://gyazo.com/upload.cgi | strings]
    #url = IO.popen(cmd, "r+") do |io|
    #  io.puts(data)
    #  io.close_write
    #  io.read
    #end

		hashtags = '#llplanets #v6hack'
		@client.update("#{color} #{hashtags}")
  end
end
