require 'spec_helper'

describe Book do

  it 'with valid data' do
    expect { FactoryGirl.create(:book) }.to_not raise_error
  end

  it 'with invalid data' do
    expect { FactoryGirl.create(:invalid_book) }.to raise_error
  end

  it { should allow_mass_assignment_of(:title) }
  it { should allow_mass_assignment_of(:isbn) }
  it { should allow_mass_assignment_of(:description) }
  it { should allow_mass_assignment_of(:publisher) }
  it { should allow_mass_assignment_of(:authors) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:isbn) }
  #it { should ensure_length_of(:isbn).is_equal_to(13) } This validation only works with strings
  it { should validate_presence_of(:description) }
  it { should validate_uniqueness_of(:title) }
  it { should validate_numericality_of(:isbn) }
  it { should belong_to(:publisher) }
  it { should have_many(:authors) }
  it { should have_many(:author_books) }

  context 'length of isbn' do
    it 'with 13 numbers' do
      expect{ FactoryGirl.create(:book, isbn: '1234567890123') }.to_not raise_error
    end

    it 'with less than 13 numbers' do
      expect{ FactoryGirl.create(:book, isbn: '34567890123') }.to raise_error
    end

    it 'with great than 13 numbers' do
      expect{ FactoryGirl.create(:book, isbn: '1231234567890123') }.to raise_error
    end
  end
end
