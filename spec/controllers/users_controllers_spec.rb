require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'POST#create' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:user_with_errors) do
      User.create(role: "member", first_name: "Nick", last_name: "Giannini", username: "nickgiannini", email: nil, encrypted_password: "password", password: "password", password_confirmation: "password", sign_in_count: 0)
    end

    it 'should create a new user' do
      post_json = JSON.parse user.to_json
      user_count = User.count

      post(:create, params: { user: post_json })
      expect(User.count).to eq(user_count)
    end

    it 'should give the user errors when signing up' do
      post_json = JSON.parse user_with_errors.to_json
      user_count = User.count

      post(:create, params: { user: post_json })
      expect(User.count).to eq(user_count)
      expect(user_with_errors.errors.messages[:email].first).to eq "can't be blank"
    end
  end
end
