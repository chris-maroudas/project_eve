require 'steam_api'
class ApplicationController < ActionController::Base
  protect_from_forgery
  include SteamApi

end
