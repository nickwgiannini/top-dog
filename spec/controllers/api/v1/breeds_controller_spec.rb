require "rails_helper"

RSpec.describe Api::V1::BreedsController, type: :controller do
  let!(:first_breed) {Breed.create(name: "shitzu", life_expectancy: 1, personality: "Horrible", shedding: "no", height: 11, weight: 10, grooming: "seasonal", img_url: "www.dogs.com")}
  let!(:second_breed) {Breed.create(name: "shizzoo", life_expectancy: 1, personality: "Horrible", shedding: "no", height: 11, weight: 10, grooming: "seasonal", img_url: "www.dogs.com")}

  describe "GET#index" do
    it "should return a list of the breeds" do

      get :index
      returned_json = JSON.parse(response.body)

    end
  end
end
