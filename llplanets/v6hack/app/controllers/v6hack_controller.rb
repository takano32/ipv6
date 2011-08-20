class V6hackController < ApplicationController
  def index
    render :text => request.host
  end
end
