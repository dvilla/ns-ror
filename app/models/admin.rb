class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :uid, :provider

  # attr_accessible :title, :body
  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    name, email, uid, provider = data['name'], data['email'], access_token.uid, access_token.provider
    user = Admin.where(email: email).first

    if user.nil? and valid_user?(email)
      user = Admin.create(
        name: name, 
        email: email, 
        uid: uid, 
        provider: provider, 
        password: Devise.friendly_token[0, 20])
    end
    user 
  end

  private
  def self.valid_user? user
    user.match(/@nearsoft.com/) == nil ? false : true
  end
  
end
