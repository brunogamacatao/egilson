class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def facebook
    return unless session['oauth_token']
    session['fb_user'] ||= FbGraph::User.me(session['oauth_token']).fetch
  end
  helper_method :facebook
  
  def get_facebook_user(username)
    FbGraph::User.fetch(username)
  end
  helper_method :get_facebook_user
  
  def set_locale
    I18n.locale = :"pt-BR"
  end
  before_filter :set_locale
end
