# frozen_string_literal: true

class WordsController < ApplicationController
  def all_words
    words = Word.all
    render json: words.map(&:to_h)
  end
end
