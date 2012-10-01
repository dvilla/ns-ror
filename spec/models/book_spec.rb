require 'spec_helper'

describe Book do
  it 'should create a valid book' do
    expect { FactoryGirl.create(:book) }.to_not raise_error
  end
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:isbn) }
  it { should validate_presence_of(:description) }
  it { should validate_uniqueness_of(:title) }
  it { should validate_numericality_of(:isbn) }
  it { should belong_to(:publisher) }
  it { should have_many(:authors) }
  it { should have_many(:author_books) }
end
