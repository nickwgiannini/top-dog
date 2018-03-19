RSpec.describe Api::V1::ReviewsController, type: :controller do
  let!(:b1) do
    Breed.create(
      name: 'Affenpinscher',
      life_expectancy: '12-15 years',
      personality: 'confident, famously funny, fearless',
      shedding: 'Seasonal',
      height: '9-11.5 inches',
      weight: '7-10 pounds',
      grooming: '2-3 times a week brushing',
      img_url: 'http://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/13002132/Affenpinscher-Care.jpg',
    )
  end

  let!(:u1) do
    User.create(
      email: "nicccckkkkkk@gmail.com",
      encrypted_password: "fsrt",
      password: "asddsaasddsa",
      sign_in_count: 1,
      created_at: Time.now,
      updated_at: Time.now
    )
  end

  let!(:r1) do
    Review.create(
      breed_id: b1.id,
      user_id: u1.id,
      kid_friendly: 6,
      dog_friendly: 9,
      barking_lvl: 3,
      trainability: 8,
      energy_lvl: 6
    )
  end
  let!(:r2) do
    Review.create(
      breed_id: b1.id,
      user_id: u1.id,
      kid_friendly: 63,
      dog_friendly: 92,
      barking_lvl: 3,
      trainability: 8,
      energy_lvl: 6
    )
  end

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
    it 'should have errors when creating wrong' do
      post_json = JSON.parse r2.to_json
      params = {
        review: post_json
      }
      review_count = Review.count
      post(:create, params: params)
      expect(Review.count).to eq(review_count)
      expect(r2.errors.messages[:kid_friendly].first).to eq "is not included in the list"
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
