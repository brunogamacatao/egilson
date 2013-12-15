class CustomFailure < Devise::FailureApp
  def redirect_url
    puts warden_options.to_yaml
    
    if warden_options[:scope] == :user
      user_omniauth_authorize_path(:facebook)
    else
      super
    end
  end
  
  def respond
    if http_auth?
      http_auth
    else
      redirect
    end
  end
end