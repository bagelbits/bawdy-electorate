describe WordsController, type: :controller do
  describe 'GET #index' do
    it 'returns all words' do
      create_list(:word, 3)
      extra_word = build(:word, word: Word::WORD_OF_THE_DAY, count: Word.maximum(:count) * 2)

      get :index

      expect(response).to have_http_status(:ok)
      expect(response.body).to eq((Word.all.map(&:to_h).to_a << extra_word.to_h).to_json)
    end
  end

  describe 'GET #cloud' do
    it 'renders the word cloud' do
      get :cloud
      expect(response.code).to eq('200')
    end
  end
end
