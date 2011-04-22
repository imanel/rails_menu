require 'test/unit'
require 'rails_menu'

Dir["#{File.dirname(__FILE__)}/support/*.rb"].each { |f| require f }

RailsMenu::Routes = ActionDispatch::Routing::RouteSet.new
RailsMenu::Routes.draw do
  match ':controller(/:action(/:id(.:format)))'
end

class ApplicationController < ActionController::Base; end
ActionController::Base.send :include, RailsMenu::Routes.url_helpers
