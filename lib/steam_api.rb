module SteamApi
  module Users

    def self.get_recent_matches(user)
      url = URI.parse("https://api.steampowered.com/IDOTA2Match_570/GetMatchHistory/v001/?key=#{ENV['STEAM_WEB_API_KEY']}&account_id=#{user.steam_metadata.uid}")
      response = Net::HTTP::get(url)
      JSON.load(response)['result']['matches'] || []
    end

  end
end