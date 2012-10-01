require 'spec_helper'

describe Author do
  it 'create a valid author' do
    expect{ FactoryGirl.create(:author) }.to_not raise_error
  end

  it 'not create a invalid author' do
    expect{ FactoryGirl.create(:invalid_author) }.to raise_error
  end

  it { should validate_presence_of(:name) }
  it { should have_many(:books) }
  it { should have_many(:author_books) }
end
