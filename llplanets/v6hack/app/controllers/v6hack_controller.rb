class V6hackController < ApplicationController
  def index
    render :text => Tweet.new(104756918937063424).get
  end
end
