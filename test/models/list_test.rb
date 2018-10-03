require 'test_helper'

class ListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save list with invalid" do
    list = List.new
    assert_not list.save, "Saved the list without attributes"
  end

  test "1 plus 1 should equal 2" do
    num = 1 + 1
    assert_equal( 2, num, 'you da worst' )
  end
end
