require 'open-uri'

class GamesController < ApplicationController
  def new
  @letters = (0...10).map { ('a'..'z').to_a[rand(26)] }.join.upcase
  end

  def score
    @letters = (0...10).map { ('a'..'z').to_a[rand(26)] }.join.upcase

    @user_word = params[:user_word]

    url = "https://wagon-dictionary.herokuapp.com/#{@user_word}"
    user_serialized = open(url).read
    test = true
    @user = JSON.parse(user_serialized)

    if JSON.parse(user_serialized)['found']
      @user_word.chars.each do |letter|
        @letters.include?(letter) ? @letters.delete(@letters[letter]) : test = false
      end
      if test == true
        return @message = 'well done'
      elsif test = false
        return @message = 'not in the grid'
      else
        return @message = 'not an english word'
      end

    end
  end
end
