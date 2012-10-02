require 'spec_helper'

describe User do

  it 'should be saved in the database' do
    expect { FactoryGirl.create(:user) }.to_not raise_error
  end
  
  it 'should no be saved in the database' do
    expect { FactoryGirl.create(:invalid_user) }.to raise_error
  end
end
