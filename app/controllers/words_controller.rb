# frozen_string_literal: true

class WordsController < ApplicationController
  def index
    words = Word.where.not(word: Word::WORD_OF_THE_DAY).to_a
    max_count = Word.maximum(:count)
    word_of_the_day = Word.new(word: Word::WORD_OF_THE_DAY, count: max_count * 2)
    words << word_of_the_day
    render json: words.map(&:to_h)
  end

  def cloud
    render component: 'WordCloud'
  end
end
