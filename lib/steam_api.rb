module SteamApi

  AVAILABLE_CALLS = {
    match_details: "GetMatchDetails",
    match_history: "GetMatchHistory"
  }

  def self.build_url(call, user = nil)
    URI.parse("https://api.steampowered.com/IDOTA2Match_570/#{call}/v001/?key=#{ENV['STEAM_WEB_API_KEY']}&account_id=#{user.steam_metadata.uid}")
  end

  module Users

    def self.get_recent_matches(user)
      url = SteamApi::build_url(AVAILABLE_CALLS[:match_history], user)
      response = Net::HTTP::get(url)
      JSON.load(response)['result']['matches'] || []
    end


  end

  module Matches
    def self.get_match_details(match)
    end
  end

end