class WelcomeController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => :auth_callback

  def index
  end

  def auth_callback
    auth = request.env['omniauth.auth']
    session[:steam_user] = { :nickname => auth.info['nickname'],
                               :image => auth.info['image'],
                               :uid => auth.uid,
                               :steam_profile_link => auth.info.urls.Profile,
                               :friend_list => auth.info.urls.FriendList
    }


    generated_pass = Array.new(14){[*'0'..'9', *'a'..'z', *'A'..'Z'].sample}.join
    credentials = {
      nickname: auth.info['nickname'],
      email: auth.info['nickname'] + auth.uid + '@eve.gr',
      image_url: auth.info['image'],
      password: generated_pass,
      password_confirmation: generated_pass,
      steam_user: true
    }

    steam_user = User.new(credentials)
    steam_user.save

    sign_in(steam_user)

    redirect_to root_url
  end

end
