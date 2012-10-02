require 'spec_helper'

describe Admin do

  it { should validate_uniqueness_of(:email) }
  it { should have_many(:roles) }

  it 'should create a valid Admin' do
    expect{ FactoryGirl.create(:admin) }.to_not raise_error
  end

  it 'should not create a invalid Admin' do
    expect{ FactoryGirl.create(:invalid_admin) }.to raise_error
  end
end
