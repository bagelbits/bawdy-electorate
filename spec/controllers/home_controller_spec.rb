# frozen_string_literal: true

describe HomeController do
  it 'renders the homepage' do
    get :index
    expect(response.code).to eq('200')
  end
end
