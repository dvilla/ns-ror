require 'spec_helper'

describe Rol do

  it { should validate_presence_of(:name) }
  it { should have_many(:admins) }

  it "should create a valid Rol" do
    expect { FactoryGirl.create(:rol) }.to_not raise_error
  end

  it "should not create a invalid Rol" do
    expect { FactoryGirl.create(:invalid_rol) }.to raise_error
  end
end
