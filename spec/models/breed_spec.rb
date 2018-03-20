require 'rails_helper'
require 'spec_helper'
require_relative '../../app/models/review'

describe Breed do
  it { should have_valid(:name).when("Shih Tzu") }
  it { should_not have_valid(:name).when(nil) }

  it { should have_valid(:life_expectancy).when("10 - 18 years") }
  it { should_not have_valid(:life_expectancy).when(nil) }

  it { should have_valid(:personality).when("Outgoing, affectionate, & playfull") }
  it { should_not have_valid(:personality).when(nil) }

  it { should have_valid(:shedding).when("infrequent") }
  it { should_not have_valid(:shedding).when(nil) }

  it { should have_valid(:height).when("9 - 10.5 inches") }
  it { should_not have_valid(:height).when(nil) }

  it { should have_valid(:weight).when("9 - 16 pounds") }
  it { should_not have_valid(:weight).when(nil) }

  it { should have_valid(:grooming).when("Daily brushing") }
  it { should_not have_valid(:grooming).when(nil) }

  it { should have_valid(:img_url).when("http://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12224359/Shih-Tzu-Care.jpg") }
  it { should_not have_valid(:img_url).when(nil) }
end
