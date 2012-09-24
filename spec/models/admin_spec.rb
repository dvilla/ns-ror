require 'spec_helper'

describe Admin do

  it { should validate_uniqueness_of(:email) }
  it 'should create a valid Admin' do
    expect{ FactoryGirl.create(:admin) }.to_not raise_error
  end
end
