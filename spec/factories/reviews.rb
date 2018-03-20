FactoryBot.define do
  factory :review do
    kid_friendly 10
    dog_friendly 6
    barking_lvl 2
    trainability 7
    energy_lvl 7
    user
    breed
  end
end
