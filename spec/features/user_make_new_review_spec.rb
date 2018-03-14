require 'rails_helper'
require 'spec_helper'

feature "Review created meets validation criteria" do
  scenario "user correctly created a new review" do
    u1 = User.create(email: "asd@gmail.com", encrypted_password: "fsrt", password: "fsrt", sign_in_count: 1, created_at: Time.now, updated_at: Time.now )
    b1 = Breed.create(name: "shitzu", life_expectancy: 1, personality: "Horrible", shedding: "no", height: 11, weight: 10, grooming: "seasonal", img_url: "poop")
    r1 = Review.create(breed: b1, user: u1, kid_friendly: 6, dog_friendly: 9, barking_lvl: 3, trainability: 8, energy_lvl: 6)

    expect(r1.valid?).to be true
  end
  scenario "user incorrectly tries to create a review" do
    u2 = User.create(email: "asd@gmail.com", encrypted_password: "fsrt", password: "fsrt", sign_in_count: 1, created_at: Time.now, updated_at: Time.now )
    b2 = Breed.create(name: "shitzu", life_expectancy: 1, personality: "Horrible", shedding: "no", height: 11, weight: 10, grooming: "seasonal", img_url: "poop")
    r2 = Review.create(breed: b2, user: u2, kid_friendly: 6, dog_friendly: 69, barking_lvl: 3, trainability: 8, energy_lvl: 6)

    expect(r2.valid?).to be false
  end
end
#
