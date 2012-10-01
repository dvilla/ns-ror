require 'spec_helper'

describe Publisher do
  it 'should create a valid book' do
    expect { FactoryGirl.create(:publisher) }.to_not raise_error
  end
  it { should validate_presence_of(:name) }
  it { should have_many(:books) }
end
