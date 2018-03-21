RSpec.describe Api::V1::ReviewsController, type: :controller do
  describe 'GET#index' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:breed) { FactoryBot.create(:breed) }
    let!(:review) { FactoryBot.create(:review, user: user, breed: breed) }

    it 'returns a list of all the reviews' do
      sign_in user
      get :index, params: { breed: breed }
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
    let!(:review_with_errors) do
      Review.create(breed_id: breed.id, user_id: user.id, kid_friendly: 26, dog_friendly: 9, barking_lvl: 3, trainability: 8, energy_lvl: 6)
    end

    it "should create one review for the relevant breed" do
      sign_in user
      post_json = JSON.parse review.to_json
      params = {
        review: post_json
      }
      post(:create, params: params)

      expect(Review.count).to eq(2)
    end
    it 'should have errors when creating wrong' do
      sign_in user
      post_json = JSON.parse review_with_errors.to_json
      params = {
        review: post_json
      }
      review_count = Review.count
      post(:create, params: params)
      expect(Review.count).to eq(review_count)
      expect(review_with_errors.errors.messages[:kid_friendly].first).to eq "is not included in the list"
    end
    it 'should have allow to post, if not signed in' do
      sign_in nil
      post_json = JSON.parse review.to_json
      post(:create, params: { review: post_json })
      expect(response).to redirect_to(new_user_session_path)
    end
    it 'should the newly posted review and user' do
      sign_in user
      post_json = JSON.parse review.to_json
      post(:create, params: { review: post_json })
      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq('application/json')
      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json["reviews"].first['breed_id']).to eq 7
      expect(returned_json["reviews"].first['kid_friendly']).to eq 10
    end
  end
end
