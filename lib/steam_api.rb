module SteamApi

  AVAILABLE_CALLS = {
    match_details: "GetMatchDetails",
    match_history: "GetMatchHistory"
  }

  def self.get_response(url)
    Net::HTTP::get(url)
  end

  # Users API calls
  module Users

    def self.get_recent_matches(user_id) # Accept a user_id because of separation of concerns. This method should not know whether user has a steam metadata
      url = URI.parse("https://api.steampowered.com/IDOTA2Match_570/#{AVAILABLE_CALLS[:match_history]}/v001/?key=#{ENV['STEAM_WEB_API_KEY']}&account_id=#{user_id}")
      JSON.load(SteamApi::get_response(url))['result']['matches'] || []
    end

  end

  # Matches API calls
  module Matches

    def self.get_match_details(match_id)
      url = URI.parse("https://api.steampowered.com/IDOTA2Match_570/#{AVAILABLE_CALLS[:match_details]}/v001/?key=#{ENV['STEAM_WEB_API_KEY']}&match_id=#{match_id}")
      JSON.load(SteamApi::get_response(url)) || []
    end

  end



  # LIBRARY

  module Heroes
    HEROES = {
      1 => "Anti-Mage",
      2 => "Axe",
      3 => "Bane",
      4 => "Bloodseeker",
      5 => "Crystal Maiden",
      6 => "Drow Ranger",
      7 => "Earthshaker",
      8 => "Juggernaut",
      9 => "Mirana",
      11 => "Shadow Fiend",
      10 => "Morphling",
      12 => "Phantom Lancer",
      13 => "Puck",
      14 => "Pudge",
      15 => "Razor",
      16 => "Sand King",
      17 => "Storm Spirit",
      18 => "Sven",
      19 => "Tiny",
      20 => "Vengeful Spirit",
      21 => "Windrunner",
      22 => "Zeus",
      23 => "Kunkka",
      25 => "Lina",
      31 => "Lich",
      26 => "Lion",
      27 => "Shadow Shaman",
      28 => "Slardar",
      29 => "Tidehunter",
      30 => "Witch Doctor",
      32 => "Riki",
      33 => "Enigma",
      34 => "Tinker",
      35 => "Sniper",
      36 => "Necrolyte",
      37 => "Warlock",
      38 => "Beastmaster",
      39 => "Queen of Pain",
      40 => "Venomancer",
      41 => "Faceless Void",
      42 => "Skeleton King",
      43 => "Death Prophet",
      44 => "Phantom Assassin",
      45 => "Pugna",
      46 => "Templar Assassin",
      47 => "Viper",
      48 => "Luna",
      49 => "Dragon Knight",
      50 => "Dazzle",
      51 => "Clockwerk",
      52 => "Leshrac",
      53 => "Nature's Prophet",
      54 => "Lifestealer",
      55 => "Dark Seer",
      56 => "Clinkz",
      57 => "Omniknight",
      58 => "Enchantress",
      59 => "Huskar",
      60 => "Night Stalker",
      61 => "Broodmother",
      62 => "Bounty Hunter",
      63 => "Weaver",
      64 => "Jakiro",
      65 => "Batrider",
      66 => "Chen",
      67 => "Spectre",
      69 => "Doom",
      68 => "Ancient Apparition",
      70 => "Ursa",
      71 => "Spirit Breaker",
      72 => "Gyrocopter",
      73 => "Alchemist",
      74 => "Invoker",
      75 => "Silencer",
      76 => "Outworld Devourer",
      77 => "Lycanthrope",
      78 => "Brewmaster",
      79 => "Shadow Demon",
      80 => "Lone Druid",
      81 => "Chaos Knight",
      82 => "Meepo",
      83 => "Treant Protector",
      84 => "Ogre Magi",
      85 => "Undying",
      86 => "Rubick",
      87 => "Disruptor",
      88 => "Nyx Assassin",
      89 => "Naga Siren",
      90 => "Keeper of the Light",
      91 => "Wisp",
      92 => "Visage",
      93 => "Slark",
      94 => "Medusa",
      95 => "Troll Warlord",
      96 => "Centaur Warrunner",
      97 => "Magnus",
      98 => "Timbersaw",
      99 => "Bristlebog",
      100 => "Tusk",
      101 => "Skywrath Mage",
      102 => "Abaddon",
      103 => "Elder Titan",
      104 => "Legion Commander",
      106 => "Ember Spirit",
      107 => "Earth Spirit",
      108 => "Abyssal Underlord",
      109 => "Terrorblade",
      110 => "Phoenix"
    }.freeze
  end

  module Items
    ITEMS = {
      0 => 'emptyitembg',
      1 => 'blink',
      2 => 'blades_of_attack',
      3 => 'broadsword',
      4 => 'chainmail',
      5 => 'claymore',
      6 => 'helm_of_iron_will',
      7 => 'javelin',
      8 => 'mithril_hammer',
      9 => 'platemail',
      10 => 'quarterstaff',
      11 => 'quelling_blade',
      12 => 'ring_of_protection',
      13 => 'gauntlets',
      14 => 'slippers',
      15 => 'mantle',
      16 => 'branches',
      17 => 'belt_of_strength',
      18 => 'boots_of_elves',
      19 => 'robe',
      20 => 'circlet',
      21 => 'ogre_axe',
      22 => 'blade_of_alacrity',
      23 => 'staff_of_wizardry',
      24 => 'ultimate_orb',
      25 => 'gloves',
      26 => 'lifesteal',
      27 => 'ring_of_regen',
      28 => 'sobi_mask',
      29 => 'boots',
      30 => 'gem',
      31 => 'cloak',
      32 => 'talisman_of_evasion',
      33 => 'cheese',
      34 => 'magic_stick',
      35 => 'recipe_magic_wand',
      36 => 'magic_wand',
      37 => 'ghost',
      38 => 'clarity',
      39 => 'flask',
      40 => 'dust',
      41 => 'bottle',
      42 => 'ward_observer',
      43 => 'ward_sentry',
      44 => 'tango',
      45 => 'courier',
      46 => 'tpscroll',
      47 => 'recipe_travel_boots',
      48 => 'travel_boots',
      49 => 'recipe_phase_boots',
      50 => 'phase_boots',
      51 => 'demon_edge',
      52 => 'eagle',
      53 => 'reaver',
      54 => 'relic',
      55 => 'hyperstone',
      56 => 'ring_of_health',
      57 => 'void_stone',
      58 => 'mystic_staff',
      59 => 'energy_booster',
      60 => 'point_booster',
      61 => 'vitality_booster',
      62 => 'recipe_power_treads',
      63 => 'power_treads',
      64 => 'recipe_hand_of_midas',
      65 => 'hand_of_midas',
      66 => 'recipe_oblivion_staff',
      67 => 'oblivion_staff',
      68 => 'recipe_pers',
      69 => 'pers',
      70 => 'recipe_poor_mans_shield',
      71 => 'poor_mans_shield',
      72 => 'recipe_bracer',
      73 => 'bracer',
      74 => 'recipe_wraith_band',
      75 => 'wraith_band',
      76 => 'recipe_null_talisman',
      77 => 'null_talisman',
      78 => 'recipe_mekansm',
      79 => 'mekansm',
      80 => 'recipe_vladmir',
      81 => 'vladmir',
      84 => 'flying_courier',
      85 => 'recipe_buckler',
      86 => 'buckler',
      87 => 'recipe_ring_of_basilius',
      88 => 'ring_of_basilius',
      89 => 'recipe_pipe',
      90 => 'pipe',
      91 => 'recipe_urn_of_shadows',
      92 => 'urn_of_shadows',
      93 => 'recipe_headdress',
      94 => 'headdress',
      95 => 'recipe_sheepstick',
      96 => 'sheepstick',
      97 => 'recipe_orchid',
      98 => 'orchid',
      99 => 'recipe_cyclone',
      100 => 'cyclone',
      101 => 'recipe_force_staff',
      102 => 'force_staff',
      103 => 'recipe_dagon',
      197 => 'recipe_dagon_2',
      198 => 'recipe_dagon_3',
      199 => 'recipe_dagon_4',
      200 => 'recipe_dagon_5',
      104 => 'dagon',
      201 => 'dagon_2',
      202 => 'dagon_3',
      203 => 'dagon_4',
      204 => 'dagon_5',
      105 => 'recipe_necronomicon',
      191 => 'recipe_necronomicon_2',
      192 => 'recipe_necronomicon_3',
      106 => 'necronomicon',
      193 => 'necronomicon_2',
      194 => 'necronomicon_3',
      107 => 'recipe_ultimate_scepter',
      108 => 'ultimate_scepter',
      109 => 'recipe_refresher',
      110 => 'refresher',
      111 => 'recipe_assault',
      112 => 'assault',
      113 => 'recipe_heart',
      114 => 'heart',
      115 => 'recipe_black_king_bar',
      116 => 'black_king_bar',
      117 => 'aegis',
      118 => 'recipe_shivas_guard',
      119 => 'shivas_guard',
      120 => 'recipe_bloodstone',
      121 => 'bloodstone',
      122 => 'recipe_sphere',
      123 => 'sphere',
      124 => 'recipe_vanguard',
      125 => 'vanguard',
      126 => 'recipe_blade_mail',
      127 => 'blade_mail',
      128 => 'recipe_soul_booster',
      129 => 'soul_booster',
      130 => 'recipe_hood_of_defiance',
      131 => 'hood_of_defiance',
      132 => 'recipe_rapier',
      133 => 'rapier',
      134 => 'recipe_monkey_king_bar',
      135 => 'monkey_king_bar',
      136 => 'recipe_radiance',
      137 => 'radiance',
      138 => 'recipe_butterfly',
      139 => 'butterfly',
      140 => 'recipe_greater_crit',
      141 => 'greater_crit',
      142 => 'recipe_basher',
      143 => 'basher',
      144 => 'recipe_bfury',
      145 => 'bfury',
      146 => 'recipe_manta',
      147 => 'manta',
      148 => 'recipe_lesser_crit',
      149 => 'lesser_crit',
      150 => 'recipe_armlet',
      151 => 'armlet',
      183 => 'recipe_invis_sword',
      152 => 'invis_sword',
      153 => 'recipe_sange_and_yasha',
      154 => 'sange_and_yasha',
      155 => 'recipe_satanic',
      156 => 'satanic',
      157 => 'recipe_mjollnir',
      158 => 'mjollnir',
      159 => 'recipe_skadi',
      160 => 'skadi',
      161 => 'recipe_sange',
      162 => 'sange',
      163 => 'recipe_helm_of_the_dominator',
      164 => 'helm_of_the_dominator',
      165 => 'recipe_maelstrom',
      166 => 'maelstrom',
      167 => 'recipe_desolator',
      168 => 'desolator',
      169 => 'recipe_yasha',
      170 => 'yasha',
      171 => 'recipe_mask_of_madness',
      172 => 'mask_of_madness',
      173 => 'recipe_diffusal_blade',
      195 => 'recipe_diffusal_blade_2',
      174 => 'diffusal_blade',
      196 => 'diffusal_blade_2',
      175 => 'recipe_ethereal_blade',
      176 => 'ethereal_blade',
      177 => 'recipe_soul_ring',
      178 => 'soul_ring',
      179 => 'recipe_arcane_boots',
      180 => 'arcane_boots',
      181 => 'orb_of_venom',
      182 => 'stout_shield',
      184 => 'recipe_ancient_janggo',
      185 => 'ancient_janggo',
      186 => 'recipe_medallion_of_courage',
      187 => 'medallion_of_courage',
      188 => 'smoke_of_deceit',
      189 => 'recipe_veil_of_discord',
      190 => 'veil_of_discord',
      205 => 'recipe_rod_of_atos',
      206 => 'rod_of_atos',
      207 => 'recipe_abyssal_blade',
      208 => 'abyssal_blade',
      209 => 'recipe_heavens_halberd',
      210 => 'heavens_halberd',
      211 => 'recipe_ring_of_aquila',
      212 => 'ring_of_aquila',
      213 => 'recipe_tranquil_boots',
      214 => 'tranquil_boots',
      215 => 'shadow_amulet',
      216 => 'halloween_candy_corn',
      217 => 'mystery_hook',
      218 => 'mystery_arrow',
      219 => 'mystery_missile',
      220 => 'mystery_toss',
      221 => 'mystery_vacuum',
      226 => 'halloween_rapier',
      228 => 'greevil_whistle',
      235 => 'greevil_whistle_toggle',
      227 => 'present',
      229 => 'winter_stocking',
      230 => 'winter_skates',
      231 => 'winter_cake',
      232 => 'winter_cookie',
      233 => 'winter_coco',
      234 => 'winter_ham',
      236 => 'winter_kringle',
      237 => 'winter_mushroom',
      238 => 'winter_greevil_treat',
      239 => 'winter_greevil_garbage',
      240 => 'winter_greevil_chewy',
      241 => 'tango_single'
    }.freeze
  end

  module MatchModes
    MODES = {
      1 => 'All Pick',
      2 => 'Captains Mode',
      3 => 'Random Draft',
      4 => 'Single Draft',
      5 => 'All Random',
      6 => '?? INTRO/DEATH ??',
      7 => 'The Diretide',
      8 => 'Reverse Captains Mode',
      9 => 'Greeviling',
      10 => 'Tutorial',
      11 => 'Mid Only',
      12 => 'Least Played',
      13 => 'New Player Pool',
      14 => 'Compendium Matchmaking',
      15 => 'Custom',
      16 => 'Captains Draft',
      17 => 'Balanced Draft',
      18 => 'Ability Draft'
    }.freeze
  end

end