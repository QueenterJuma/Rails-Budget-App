require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  before :each do
    @user = User.create(name: 'Test', email: 'test2@example.com', password: 'password')
    sign_in @user
  end
  describe 'GET /index' do
    it 'returns http success' do
      get '/groups'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      Group.create(author: @user, name: 'Investment', icon: 'https://www.econlib.org/wp-content/uploads/2018/02/investment.jpg')
      get group_path(Group.last)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST :create' do
    it 'creates a new group' do
      group_attributes = { name: 'Investment', icon: 'https://www.econlib.org/wp-content/uploads/2018/02/investment.jpg' }

      post '/groups', params: { group: group_attributes }

      expect(response.status).to eq(302)
      expect(Group.last.name).to eq('Investment')
      expect(Group.last.icon).to eq('https://www.econlib.org/wp-content/uploads/2018/02/investment.jpg')
    end
  end
end
