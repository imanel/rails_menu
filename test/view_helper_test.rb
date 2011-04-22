require "./test/test_helper"

class ViewHelperTest < ActionView::TestCase
  tests RailsMenu::ViewHelper

  attr_accessor :controller, :request

  def setup
    @menu = RailsMenu::Set.new
  end

  def teardown
    RailsMenu::Set.list.keys.each { |key| RailsMenu::Set.list.delete(key) }
  end

  test "default menu is empty" do
    assert_equal [], menu("default")
  end

  test "unknown menu is empty" do
    assert_equal [], menu("unknown")
  end

  test "access elements in menu" do
    element = @menu.add("my", "url", :my => "options")
    assert_equal [element], menu("default")
  end

  test "current element should be active" do
    @rails_menu_active = "second"
    first = @menu.add("first")
    second = @menu.add("second")
    assert_equal [first, second], menu("default")
    assert_equal false, first.active
    assert_equal true, second.active
  end

end