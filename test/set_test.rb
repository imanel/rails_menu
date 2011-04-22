require './test/test_helper'

class SetTest < Test::Unit::TestCase

  def teardown
    RailsMenu::Set.list.keys.each { |key| RailsMenu::Set.list.delete(key) }
  end

  def test_empty_list
    assert_equal RailsMenu::Set.list, {}
  end

  def test_adding_default
    set = RailsMenu::Set.new
    assert_equal RailsMenu::Set, set.class
    assert_equal 'default', set.name
    assert_equal [], set.elements
    assert_equal set, RailsMenu::Set['default']
  end

  def test_adding_custom
    set = RailsMenu::Set.new('my_name', [
      ['first', '/first'],
      ['second', '/second']
    ])
    assert_equal RailsMenu::Set, set.class
    assert_equal 'my_name', set.name
    assert_not_equal [], set.elements
    assert_equal set, RailsMenu::Set['my_name']
  end

  def test_adding_element
    set = RailsMenu::Set.new('default')
    assert_equal [], set.elements
    element = set.add('my', 'url')
    assert_equal [element], set.elements
  end

end