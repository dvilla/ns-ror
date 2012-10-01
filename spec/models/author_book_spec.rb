require 'spec_helper'

describe AuthorBook do
  it 'should create a valid book' do
    expect{ FactoryGirl.create(:book) }.to_not raise_error
  end
  it 'should create an invalid book' do	
    expect{ FactoryGirl.create(:invalid_book) }.to raise_error
  end
  it { should belong_to(:author) }
  it { should belong_to(:book) }
end
