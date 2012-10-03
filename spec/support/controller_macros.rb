module ControllerMacros
  def login_admin
    before(:each) do
      @request['devise.mapping'] = Devise.mappings[:admin]
      sign_in FactoryGirl.create(:admin)
    end
  end

  def login_user
    before(:each) do
      @request['devise.mapping'] = Devise.mappings[:user]
      sign_in FactoryGirl.create(:user)
    end
  end
end