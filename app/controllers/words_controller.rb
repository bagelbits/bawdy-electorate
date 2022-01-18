# frozen_string_literal: true

class WordsController < ApplicationController
  def index
    words = Word.all
    render json: words.map(&:to_h)
  end

  def cloud
    render component: 'WordCloud'
  end
end
