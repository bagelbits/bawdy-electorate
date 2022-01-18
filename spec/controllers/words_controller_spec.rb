describe WordsController, type: :controller do
  describe 'GET #index' do
    it 'returns all words' do
      create_list(:word, 3)

      get :index

      expect(response).to have_http_status(:ok)
      expect(response.body).to eq(Word.all.map(&:to_h).to_json)
    end
  end

  describe 'GET #cloud' do
    it 'renders the word cloud' do
      get :cloud
      expect(response.code).to eq('200')
    end
  end
end
