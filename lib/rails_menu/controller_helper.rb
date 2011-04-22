module RailsMenu
  module ControllerHelper

    def self.included(base)
      base.extend ClassMethods
    end

    def set_menu(id)
      @rails_menu_active = id
    end

    module ClassMethods
      def set_menu(id, options = {})
        before_filter(options) do
          set_menu id
        end
      end
    end

  end
end
