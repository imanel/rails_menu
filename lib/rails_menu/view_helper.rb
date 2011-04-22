module RailsMenu
  module ViewHelper

    def menu(set_name = 'default')
      set = RailsMenu::Set[set_name]
      elements = set.nil? ? [] : set.elements
      elements.each do |elem|
        elem.active = (@rails_menu_active.to_s == elem.id ? true : false)
      end
      elements
    end

  end
end
