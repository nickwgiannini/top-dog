require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_valid(:email).when("nick@gmail.com") }
  it do
    should_not have_valid(:email)
      .when(nil, '', 'kgfdhtfsjgfc', 'kgfdhtfsjgfc.com', 'kgfdhtfsjgf@com' )
  end

  it { should have_valid(:first_name).when('Jack') }
  it { should have_valid(:last_name).when('Ripper') }
  it { should have_valid(:username).when('TheRipper') }
  it { should_not have_valid(:username).when('', nil, '___', "Robert'); DROP TABLE STUDENTS; --'", 'boo') }

  it { should have_valid(:encrypted_password).when("dogfanatic") }
  it { should_not have_valid(:encrypted_password).when(nil) }
  it { should have_valid(:password).when("dogfanatic") }
  it { should_not have_valid(:password).when(nil, '','fresd') }

  it { should have_valid(:role).when('member', 'admin') }
  it { should_not have_valid(:role).when('', nil,) }

  it 'has a matching confirmation of password' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'diff_password'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end

describe "#admin?" do
  let!(:member) { FactoryBot.build(:user, role: 'member') }
  let!(:admin) { FactoryBot.build(:user, role: 'admin') }
  it "is not an admin if the role is not admin "do
    expect(member.admin?).to eq(false)
    expect(admin.admin?).to eq(true)
   end
  end
end
