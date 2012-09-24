require 'spec_helper'

describe AdminController do

  describe "GET 'index'" do
    before(:each) do
      @admin = FactoryGirl.create(:admin)
      sign_in @admin
    end
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

end
