require './test/test_helper'

class ActiveSupport::TestCase
  setup do
    @routes = RailsMenu::Routes
  end
end

class BooksController < ApplicationController
  set_menu :books
  def index; end
end

class SettingsController < ApplicationController
  set_menu :settings, :only => :index

  def index; end

  def other; end

  def notifications
    set_menu :notification
  end
end

class BooksControllerTest < ActionController::TestCase
  test "assign global" do
    get :index
    assert_equal(:books, assigns(:rails_menu_active))
  end
end

class SettingsControllerTest < ActionController::TestCase
  test "assign specific action" do
    get :index
    assert_equal(:settings, assigns(:rails_menu_active))
  end

  test "ignore specific action" do
    get :other
    assert_equal(nil, assigns(:rails_menu_active))
  end

  test "override specific action" do
    get :notifications
    assert_equal(:notification, assigns(:rails_menu_active))
  end
end