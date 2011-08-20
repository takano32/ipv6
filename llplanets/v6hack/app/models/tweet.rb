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
end