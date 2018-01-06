require 'test_helper'

class BookmarkTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @bookmark = @user.bookmarks.build(content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @bookmark.valid?
  end

  test "user id should be present" do
    @bookmark.user_id = nil
    assert_not @bookmark.valid?
  end
  
  test "content should be present" do
    @bookmark.content = "   "
    assert_not @bookmark.valid?
  end

  test "content should be at most 2083 characters" do
    @bookmark.content = "a" * 2084
    assert_not @bookmark.valid?
  end
  
  test "order should be most recent first" do
    assert_equal bookmarks(:most_recent), Bookmark.first
  end
end
