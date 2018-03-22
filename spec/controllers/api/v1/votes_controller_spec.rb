RSpec.describe Api::V1::VotesController, type: :controller do
  describe 'GET#index' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:breed) { FactoryBot.create(:breed) }
    let!(:review) { FactoryBot.create(:review, user: user, breed: breed) }
    let!(:vote) { FactoryBot.create(:vote, user: user, review: review, value: -1) }

    it 'returns a result of all votes' do
      get :index

      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq('application/json')

      expect(returned_json.length).to eq 1
      expect(returned_json.first['user_id']).to eq user.id
      expect(returned_json.first['review_id']).to eq review.id
      expect(returned_json.first['value']).to eq (- 1)
    end
  end

  describe 'GET#show' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:breed) { FactoryBot.create(:breed) }
    let!(:review) { FactoryBot.create(:review, user: user, breed: breed) }
    let!(:vote) { FactoryBot.create(:vote, user: user, review: review, value: 1) }

    it 'returns a specified vote' do
      get :show, params: { id: vote.id }
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq('application/json')

      expect(returned_json['user_id']).to eq user.id
      expect(returned_json['review_id']).to eq review.id
      expect(returned_json['value']).to eq 1
    end
  end

  describe "POST#create" do
    let!(:user) { FactoryBot.create(:user) }
    let!(:breed) { FactoryBot.create(:breed) }
    let!(:review) { FactoryBot.create(:review, user: user, breed: breed) }
    let!(:first_vote) { FactoryBot.create(:vote, user: user, review: review, value: 1) }
    let!(:second_vote) { FactoryBot.create(:vote, user: user, review: review, value: -1) }

    it "should create one vote for the relevant review" do
      sign_in user
      post_json = JSON.parse first_vote.to_json
      params = {
        vote: post_json
      }

      post(:create, params: params)
      expect(Vote.count).to eq(2)
    end

    it 'should change value when downvoted' do
      sign_in user
      post_json = JSON.parse first_vote.to_json
      params = {
        vote: post_json
      }
      post(:create, params: params)

      post_json = JSON.parse second_vote.to_json
      params = {
        vote: post_json
      }
      post(:create, params: params)

      expect(Vote.count).to eq(2)
      expect(Vote.where(user_id: user.id).first.value).to eq(-1)
    end
  end
end
