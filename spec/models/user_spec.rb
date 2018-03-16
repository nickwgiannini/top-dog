require 'rails_helper'

RSpec.describe User, type: :model do


  it { should have_valid(:email).when("nick@gmail.com") }
  it do
    should_not have_valid(:email)
      .when(nil, '', 'kgfdhtfsjgfc', 'kgfdhtfsjgfc.com', 'kgfdhtfsjgf@com' )
  end
  it { should_not have_valid(:email).when(nil) }

  it { should have_valid(:encrypted_password).when("dogfanatic") }
  it { should_not have_valid(:encrypted_password).when(nil) }
  it { should have_valid(:password).when("dogfanatic") }
  it { should_not have_valid(:password).when(nil, '','fresd') }

describe "#admin?" do
   it "is not an admin if the role is not admin "do
     user = User.create(
       email: "nicccckkkkkk@gmail.com",
       encrypted_password: "fsrt",
       password: "asddsaasddsa",
       sign_in_count: 1,
       created_at: Time.now,
       updated_at: Time.now,
       role: 'member'
     )
     expect(user.admin?).to eq(false)
   end

   it "is an admin if the role is admin" do
     user = User.create(
       email: "nickggggggunit@gmail.com",
       encrypted_password: "fsrt",
       password: "asddsaasdddddsa",
       sign_in_count: 1,
       created_at: Time.now,
       updated_at: Time.now,
       role: 'admin'
     )
     expect(user.admin?).to eq(true)
   end
 end
end
