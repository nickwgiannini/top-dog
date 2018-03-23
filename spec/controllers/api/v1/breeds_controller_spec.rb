require "rails_helper"

RSpec.describe Api::V1::BreedsController, type: :controller do
  describe "GET#index" do
    let!(:user) { FactoryBot.create(:user) }
    let!(:breed) { FactoryBot.create(:breed) }
    let!(:review) { FactoryBot.create(:review, user: user, breed: breed) }

    it "should return all breeds" do
      get :index
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json['breeds'][0]['user_id']).to eq user.id
      expect(returned_json['breeds'][0]['name']).to eq "Shih Tzu"
    end
  end

  describe "GET#show" do
    let!(:user) { FactoryBot.create(:user) }
    let!(:breed) { FactoryBot.create(:breed) }
    let!(:review) { FactoryBot.create(:review, breed: breed) }

    it "should return one breed and relevant reviews" do
      get :show, params: {id: breed.id, reviews: review}
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json['breed']['name'].length).to eq 8
      expect(returned_json['breed']['name']).to eq "Shih Tzu"
      expect(returned_json['reviews'].count).to eq 1
    end
  end
  describe "POST#create" do
    let!(:user) { FactoryBot.create(:user) }
    it "should create a new breed" do
      params={
        breed: {
          name: "Pitbull",
          life_expectancy: "10 - 12 years",
          personality: "stubborn, nice, fun-loving",
          shedding: "none",
          height: "24 inches",
          weight: "45 pounds",
          grooming: "none",
          img_url: "https://5.imimg.com/data5/GX/VI/MY-1596325/pitbull-dog-breed-250x250.jpg",
        },
      }

      post :create, params: params
      expect(Breed.count).to eq (1)
      expect(response).to have_http_status :ok
    end
  end
end
