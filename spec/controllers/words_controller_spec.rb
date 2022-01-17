describe WordsController, type: :controller do
  describe 'GET #all_words' do
    it 'returns all words' do
      create_list(:word, 3)

      get :all_words

      expect(response).to have_http_status(:ok)
      expect(response.body).to eq(Word.all.map(&:to_h).to_json)
    end
  end
end
