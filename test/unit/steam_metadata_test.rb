# == Schema Information
#
# Table name: steam_metadata
#
#  id          :integer          not null, primary key
#  uid         :string(255)
#  profile_url :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

require 'test_helper'

class SteamMetadataTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
