require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  describe 'POST /authenticate' do
    it 'authenticates the client' do
      post '/api/v1/authenticate', params: { email: 'dev@nickharas.com', password: '123456' }
      expect(response).to have_http_status(:created)
      # expect(response.body).to eq({ token: '123'})
    end

    it 'returns and error when email is missing' do 
      post '/api/v1/authenticate', params: { password: '123456' }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.body).to match( /param is missing or the value is empty: email/ )
    end

    it 'returns and error when password is missing' do 
      post '/api/v1/authenticate', params: { email: 'dev@nickharas.com' }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.body).to match( /param is missing or the value is empty: password/ )
    end
  end
end