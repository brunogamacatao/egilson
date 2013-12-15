class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    user = User.from_omniauth(request.env['omniauth.auth'])
    
    if user.persisted?
#      fb_user = FbGraph::User.me(request.env['omniauth.auth']['credentials']['token'])
      session['oauth_token'] = request.env['omniauth.auth']['credentials']['token']
      
      flash.notice = 'Signed in!'
      sign_in_and_redirect user
    else
      session['devise.user_attributes'] = user.attributes
      redirect_to new_user_registration_url 
    end
  end
  
  alias_method :facebook, :all
end
