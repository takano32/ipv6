# coding: utf-8
class StorageController < ApplicationController
  def index
    name = request.host.gsub('[','').gsub(']','')
    render :text => "/files/#{name}"
  end

  def create
    add(request.host, params[:file])
    name = request.host.gsub('[','').gsub(']','')
    render :text => "/files/#{name}"
  end

  private

  def add(name, io)
    path = File.join(Rails.root, 'public', 'files', name)
    File.open(path,'wb') do |f|
      f.puts io.read
    end
  end
end
