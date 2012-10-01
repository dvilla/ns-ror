class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = Admin.find_for_google_oauth2(request.env['omniauth.auth'])
    if @user.nil?
      flash[:alert] = 'Invalid domain name'
      redirect_to root_path
    elsif @user.persisted?
      flash[:notice] = 'Welcome'
      sign_in_and_redirect( @user, event: :authentication )
    else
      session['devise.google_data'] = request.env['omniauth.auth']
      redirect_to new_admin_registration_url
    end
  end
end
