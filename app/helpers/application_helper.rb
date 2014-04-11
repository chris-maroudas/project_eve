module ApplicationHelper

  def get_item_name(item_id)
    SteamApi::Items::ITEMS[item_id]
  end

  def get_hero_name(hero_id)
    SteamApi::Heroes::HEROES[hero_id]
  end

end
