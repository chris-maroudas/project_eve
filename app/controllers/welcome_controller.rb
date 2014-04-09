class WelcomeController < ApplicationController
  require 'eve_support'
  skip_before_filter :verify_authenticity_token, :only => :auth_callback


  def index
  end

  def auth_callback

    auth = request.env['omniauth.auth']
    # extra info:  auth.info.urls.Profile, auth.info.urls.FriendList
    credentials = create_credentials(auth)

    steam_user = User.find_by_email(credentials[:email])
    unless steam_user # skip creating a new user, if one is found.
      steam_user = User.new(credentials)
      steam_user.save
    end

    sign_in(steam_user) unless user_signed_in? # Prevent double steam log in.

    redirect_to root_url
  end



  private

  def create_credentials(auth)
    generated_pass = EveSupport::Password::generate_random_pass
    {
      nickname: auth.info['nickname'],
      email: (auth.info['nickname'] + auth.uid + '@eve.gr').downcase,
      image_url: auth.info['image'],
      password: generated_pass,
      password_confirmation: generated_pass,
      steam_user: true
    }
  end


end
