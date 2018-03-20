require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET#index' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:user2) { FactoryBot.create(:user) }
    it 'should show all users' do
      post_json = JSON.parse user.to_json

      user_count = User.count

      get(:index, params: { user: post_json })
      expect(User.count).to eq 2
    end
  end

  describe 'GET#show' do
    let!(:user) { FactoryBot.create(:user) }
    it 'should show a specific user' do
      get(:show, params: { id: user.id })
      post_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(post_json['user']['id']).to eq 13
    end
  end
end
