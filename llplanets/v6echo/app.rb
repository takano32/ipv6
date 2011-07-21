# -*- coding: utf-8 -*-
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'haml'

require 'model/char'

helpers do
	include Rack::Utils; alias_method :h, :escape_html
end

configure do
	set :bind, nil
	set :port, 7890
end

get '/' do
	@address = request.ip
	@address =~ %r!fe80::([0-9A-Fa-f])+(%.*)?!
	haml :index unless $1
	char = $1
	parameter = {
		:char  => char,
	}
	Chars.create(parameter)
	@chars = Chars.all
	haml :index
end

