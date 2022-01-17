# frozen_string_literal: true

RSpec.describe Word, type: :model do
  describe '.for_client' do
    let(:words) { create_list(:word, 3) }

    it 'returns an array of hashes' do
      words
      for_client = described_class.for_client
      expect(for_client).to be_an(Array)
      expect(for_client.first).to be_a(Hash)
      expect(for_client.first).to include(:word, :count)
      expect(for_client.first).to include(word: words.first.word, count: words.first.count)
    end
  end

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
      expect(word.to_h).to include(:word, :count)
      expect(word.to_h).to include(word: word.word, count: word.count)
    end
  end
end
