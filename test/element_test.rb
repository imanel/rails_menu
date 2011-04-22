require './test/test_helper'

class ElementTest < Test::Unit::TestCase

  def test_initialization
    elem = RailsMenu::Element.new('my_id', 'my_url', :my => 'hash')
    assert_equal 'my_id', elem.id
    assert_equal 'my_url', elem.url
    assert_equal({:my => 'hash'}, elem.options)
    assert_equal false, elem.active
  end

end