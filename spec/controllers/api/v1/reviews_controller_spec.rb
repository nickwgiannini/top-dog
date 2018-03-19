RSpec.describe Api::V1::ReviewsController, type: :controller do
  describe 'GET#index' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:breed) { FactoryBot.create(:breed) }
    let!(:review) { FactoryBot.create(:review, user: user, breed: breed) }

    it 'returns a list of all the reviews' do
      get :index

      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq('application/json')

      expect(returned_json.length).to eq 1
      expect(returned_json[0]['breed_id']).to eq breed.id
      expect(returned_json[0]['user_id']).to eq user.id
      expect(returned_json[0]['kid_friendly']).to eq 10
      expect(returned_json[0]['dog_friendly']).to eq 6
      expect(returned_json[0]['barking_lvl']).to eq 2
      expect(returned_json[0]['trainability']).to eq 7
      expect(returned_json[0]['energy_lvl']).to eq 7
    end
  end

  describe "POST#create" do
    let!(:user) { FactoryBot.create(:user) }
    let!(:breed) { FactoryBot.create(:breed) }
    let!(:review) { FactoryBot.create(:review, user: user, breed: breed) }

    it "should create one review for the relevant breed" do
      post_json = JSON.parse review.to_json
      params = {
        review: post_json
      }
      review_count = Review.count
      post(:create, params: params)

      expect(Review.count).to eq(review_count + 1)
    end
  end

  describe "DELETE#destroy" do
    let!(:user) { FactoryBot.create(:user) }
    let!(:breed) { FactoryBot.create(:breed) }
    let!(:review) { FactoryBot.create(:review, user: user, breed: breed) }

    it "should delete one review for the relevant breed" do
      params = {
        id: review.id
      }
      review_count = Review.count
      delete(:destroy, params: params)
      expect(Review.count).to eq(review_count - 1)
    end
  end
end
