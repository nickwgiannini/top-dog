require "rails_helper"

RSpec.describe Api::V1::BreedsController, type: :controller do
  describe "GET#index" do
    let!(:user) { FactoryBot.create(:user) }
    let!(:breed) { FactoryBot.create(:breed) }
    let!(:review) { FactoryBot.create(:review, user: user, breed: breed) }

    it "should return all breeds" do
      sign_in
      get :index
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json['breeds'][0]['name']).to eq "Shih Tzu"
    end
  end

  describe "GET#show" do
    let!(:breed) { FactoryBot.create(:breed) }
    let!(:review) { FactoryBot.create(:review, breed: breed) }

    it "should return one breed and relevant reviews" do
      sign_in
      get :show, params: {id: breed.id, reviews: review}
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json['breed']['name'].length).to eq 8
      expect(returned_json['breed']['name']).to eq "Shih Tzu"
      expect(returned_json['reviews'].count).to eq 1
    end
  end
end
