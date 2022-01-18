# frozen_string_literal: true

describe Word, type: :model do
  describe '.consume_prompt' do
    it 'creates a new word if it does not exist' do
      prompt = 'This is a test.'
      described_class.consume_prompt(prompt)
      expect(described_class.count).to eq(4)
      expect(described_class.find_by(word: 'test').count).to eq(1)
      expect(described_class.find_by(word: 'this').count).to eq(1)
    end

    it 'increments the count of an existing word' do
      prompt = 'This is a test test.'
      described_class.consume_prompt(prompt)
      expect(described_class.find_by(word: 'test').count).to eq(2)
    end
  end

  describe '#to_h' do
    let(:word) { build(:word) }

    it 'returns a hash' do
      expect(word.to_h).to be_a(Hash)
      expect(word.to_h).to include(:text, :value)
      expect(word.to_h).to include(text: word.word, value: word.count)
    end
  end
end
