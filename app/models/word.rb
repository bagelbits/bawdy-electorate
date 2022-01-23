class Word < ApplicationRecord
  self.table_name = 'words'

  WORD_OF_THE_DAY = 'tentacle'.freeze

  class << self
    def consume_prompt(prompt)
      prompt.downcase.scan(/[\w'-]+/) do |word|
        word_obj = Word.find_by(word: word)
        if word_obj
          word_obj.count += 1
          word_obj.save
        else
          Word.create!(word: word, count: 1)
        end
      end
    end
  end

  validates :word, presence: true
  validates :count, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  def to_h
    {
      text: word,
      value: count,
    }
  end
end
