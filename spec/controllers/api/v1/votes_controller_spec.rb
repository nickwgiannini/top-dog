RSpec.describe Api::V1::VotesController, type: :controller do
  describe 'GET#index' do
    it 'returns a result of all votes' do
      user = FactoryBot.create(:user)
      breed = FactoryBot.create(:breed)
      review = FactoryBot.create(:review, user: user, breed: breed)
      vote = FactoryBot.create(:vote, user: user, review: review, value: -1)

      get :index

      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq('application/json')

      expect(returned_json.length).to eq 1
      expect(returned_json[0]['user_id']).to eq user.id
      expect(returned_json[0]['review_id']).to eq review.id
      expect(returned_json[0]['value']).to eq -1
    end
  end

  describe 'GET#show' do
    it 'returns a specified vote' do
      user = FactoryBot.create(:user)
      breed = FactoryBot.create(:breed)
      review = FactoryBot.create(:review, user: user, breed: breed)
      vote = FactoryBot.create(:vote, user: user, review: review, value: 1)

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
    it "should create one vote for the relevant review" do
      user = FactoryBot.create(:user)
      breed = FactoryBot.create(:breed)
      review = FactoryBot.create(:review, user: user, breed: breed)
      vote = FactoryBot.create(:vote, user: user, review: review, value: 1)

      post_json = JSON.parse vote.to_json
      params = {
        vote: post_json
      }

      post(:create, params: params)
      expect(Vote.count).to eq(1)
    end

    it 'should change value when downvoted' do
      user = FactoryBot.create(:user)
      breed = FactoryBot.create(:breed)
      review = FactoryBot.create(:review, user: user, breed: breed)
      first_vote = FactoryBot.create(:vote, user: user, review: review, value: 1)
      second_vote = FactoryBot.create(:vote, user: user, review: review, value: -1)

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
