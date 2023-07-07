require 'rails_helper'

RSpec.describe 'Products', type: :request do
  before :each do
    @user = User.create(name: 'Test', email: 'test2@example.com', password: 'password')
    @group = Group.create(author: @user, name: 'Investment', icon: 'https://www.econlib.org/wp-content/uploads/2018/02/investment.jpg')
    sign_in @user
  end
  describe 'GET /new' do
    it 'returns http success' do
      get new_group_product_path(@group)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST :create' do
    it 'creates a new product' do
      product_attributes = { name: 'Investment', amount: 20 }

      post group_products_path(@group), params: { product: product_attributes }

      expect(response.status).to eq(302)
      expect(Product.last.name).to eq('Investment')
      expect(Product.last.amount).to eq(20.0)
    end
  end
end
