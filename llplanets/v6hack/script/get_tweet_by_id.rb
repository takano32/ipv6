#!/usr/bin/env ruby1.9
# vim: set sts=2 sw=2 ts=2 ft=ruby :

require 'rubygems'
require 'pit'
require 'oauth'
require 'rubytter'

config = Pit.get("twitter",
                 :require => {
  'consumer_key' => 'client CONSUMER_KEY',
  'consumer_secret' => 'client CONSUMER_SECRET',
  'access_token' => 'oauth ACCESS_TOKEN',
  'access_token_secret' => 'oauth ACCESS_TOKEN_SERCTET',
})
CONSUMER_KEY = config['consumer_key']

CONSUMER_SECRET = config['consumer_secret']

ACCESS_TOKEN = config['access_token']

ACCESS_TOKEN_SECRET = config['access_token_secret']

consumer = OAuth::Consumer.new(
  CONSUMER_KEY,
  CONSUMER_SECRET,
  :site => 'http://api.twitter.com'
)

access_token = OAuth::AccessToken.new(
  consumer,
  ACCESS_TOKEN,
  ACCESS_TOKEN_SECRET
)

client = OAuthRubytter.new(access_token)

