require 'spec_helper'

describe Role do

  it { should validate_presence_of(:name) }
  it { should have_many(:admins) }

  it "should create a valid Rol" do
    expect { FactoryGirl.create(:role) }.to_not raise_error
  end

  it "should not create a invalid Rol" do
    expect { FactoryGirl.create(:invalid_role) }.to raise_error
  end
end
