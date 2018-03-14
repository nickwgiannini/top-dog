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

  describe "GET#index" do
    it "should return a list of the breeds" do
      get :index
      returned_json = JSON.parse(response.body)
    end
  end
end
