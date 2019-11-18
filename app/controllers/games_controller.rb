require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = (0...10).map { ('a'..'z').to_a[rand(26)] }.join.upcase
  end

  def score
    @user_word = params[:user_word]

    url = "https://wagon-dictionary.herokuapp.com/#{@user_word}"
    user_serialized = open(url).read
    @user = JSON.parse(user_serialized)
  end
end
