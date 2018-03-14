require 'rails_helper'
require 'spec_helper'

describe Review do
  it { should have_valid(:kid_friendly).when(4) }
  it { should_not have_valid(:kid_friendly).when(nil, 11) }

  it { should have_valid(:dog_friendly).when(4) }
  it { should_not have_valid(:dog_friendly).when(nil, 11) }

  it { should have_valid(:barking_lvl).when(4) }
  it { should_not have_valid(:barking_lvl).when(nil, 11) }

  it { should have_valid(:trainability).when(4) }
  it { should_not have_valid(:trainability).when(nil, 11) }

  it { should have_valid(:energy_lvl).when(4) }
  it { should_not have_valid(:energy_lvl).when(nil, 11) }
end
