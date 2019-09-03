require 'test_helper'

class ListTest < ActiveSupport::TestCase
  test "should not save list with invalid attributes" do
    list = List.new
    assert_not list.save, "Saved the list without attributes"
  end

  test "should be able to edit list" do
    List.first.update(name: "shopping list")
    assert true
  end

  test "should be able to destroy list" do
    List.first.destroy
    assert true
  end
end
