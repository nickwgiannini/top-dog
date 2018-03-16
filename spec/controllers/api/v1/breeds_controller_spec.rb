require "rails_helper"

RSpec.describe Api::V1::BreedsController, type: :controller do
  let!(:first_breed) {Breed.create(
    name: 'Shih Tzu',
    life_expectancy:'10-18 years',
    personality:'outgoing, affectionate, playfull',
    shedding:'infrequent',
    height:'9-10.5 inches',
    weight:'9-16 pounds',
    grooming:'daily brushing',
    img_url:'http://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12224359/Shih-Tzu-Care.jpg',
    )}
    let!(:second_breed) {Breed.create(
      name: 'Silky Terrier',
      life_expectancy:'13-15 years',
      personality:'keenly alert, friendly, quick',
      shedding:'occasional',
      height:'9-10 inches',
      weight:'around 10 pounds',
      grooming:'2-3 times a week brushing',
      img_url:'http://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12224155/Silky-Terrier-Care.jpg',
      )}

      let!(:u1) {User.create(email: "asd@gmail.com", encrypted_password: "fsrt", password: "fsrt", sign_in_count: 1, created_at: Time.now, updated_at: Time.now )}

      let!(:review_list) { Review.create( user: u1, breed: first_breed, kid_friendly: 5, dog_friendly:5, barking_lvl:5, trainability:5, energy_lvl:5 ) }

      describe "GET#index" do
        it "should return all breeds" do

          get :index
          returned_json = JSON.parse(response.body)

          expect(response.status).to eq 200
          expect(response.content_type).to eq("application/json")

          expect(returned_json['breeds'][0]['name']).to eq "Shih Tzu"
          expect(returned_json['breeds'][1]['name']).to eq "Silky Terrier"
        end
      end

      describe "GET#show" do
        it "should return one breed and relevant reviews" do

          get :show, params: {id: first_breed.id, reviews: review_list}
          returned_json = JSON.parse(response.body)

          expect(response.status).to eq 200
          expect(response.content_type).to eq("application/json")

          expect(returned_json['breed']['name'].length).to eq 8
          expect(returned_json['breed']['name']).to eq "Shih Tzu"
          expect(returned_json['reviews'].count).to eq 1
        end
      end
    end
