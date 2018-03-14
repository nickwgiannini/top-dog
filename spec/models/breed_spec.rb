require 'rails_helper'
require 'spec_helper'

describe Breed do
  # it { should have_many :users }
  # it { should have_many :reviews }

  it { should have_valid(:name).when('pat') }
  it { should_not have_valid(:name).when(nil) }

  it { should have_valid(:life_expectancy).when("12 - 15 years") }
  it { should_not have_valid(:life_expectancy).when(nil) }

  it { should have_valid(:personality).when("cool") }
  it { should_not have_valid(:personality).when(nil) }

  it { should have_valid(:shedding).when("seasonal") }
  it { should_not have_valid(:shedding).when(nil) }

  it { should have_valid(:height).when(12) }
  it { should_not have_valid(:height).when(nil) }

  it { should have_valid(:weight).when(20) }
  it { should_not have_valid(:weight).when(nil) }

  it { should have_valid(:grooming).when("2 - 3 times a week") }
  it { should_not have_valid(:grooming).when(nil) }

  it { should have_valid(:img_url).when("https://images.pexels.com/photos/257540/pexels-photo-257540.jpeg?w=940&h=650&auto=compress&cs=tinysrgb") }
  it { should_not have_valid(:img_url).when(nil) }
end
