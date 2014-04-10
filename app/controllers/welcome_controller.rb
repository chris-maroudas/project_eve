class WelcomeController < ApplicationController
  require 'eve_support'
  skip_before_filter :verify_authenticity_token, :only => :auth_callback


  def index
    @matchlist = []
    if user_signed_in? && current_user.steam_user?
      @matchlist = api_get_users_recent_matches(current_user)
    end
  end



  def auth_callback

    auth = request.env['omniauth.auth']
    # extra info:  auth.info.urls.Profile, auth.info.urls.FriendList
    credentials = create_credentials(auth)
    metadata = create_metadata(auth)

    steam_user = User.find_by_email(credentials[:email])
    unless steam_user # skip creating a new user, if one is found.
      steam_user = User.new(credentials)
      steam_user.save_with_metadata(metadata)
    end

    sign_in(steam_user) unless user_signed_in? # Prevent double steam log in.

    redirect_to root_url
  end



  private

  def create_credentials(auth) # move to model?
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

  def create_metadata(auth) # move to model?
    {
      uid: auth.uid,
      profile_url: auth.info.urls.Profile
    }
  end

  # STEAM API functions

  def api_get_users_recent_matches(user)
    url = URI.parse("https://api.steampowered.com/IDOTA2Match_570/GetMatchHistory/v001/?key=#{ENV['STEAM_WEB_API_KEY']}&account_id=#{user.steam_metadata.uid}")
    response = Net::HTTP::get(url)
    JSON.load(response)['result']['matches'] || []
  end

end
