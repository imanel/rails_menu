require 'action_controller'
require 'action_view'

module RailsMenu
  ROOT = File.expand_path(File.dirname(__FILE__))

  autoload :Element,          "#{ROOT}/rails_menu/element"
  autoload :Set,              "#{ROOT}/rails_menu/set"

  autoload :ControllerHelper, "#{ROOT}/rails_menu/controller_helper"
  autoload :ViewHelper,       "#{ROOT}/rails_menu/view_helper"
end

ActionController::Base.send(:include, RailsMenu::ControllerHelper)
ActionView::Base.send(:include, RailsMenu::ViewHelper)
