require 'test_helper'

class BookmarkTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @bookmark = @user.bookmarks.build(name: "CloudBookmark", url: "https://bookmarkincloud.herokuapp.com")
  end

  test "should be valid" do
    assert @bookmark.valid?
  end

  test "user id should be present" do
    @bookmark.user_id = nil
    assert_not @bookmark.valid?
  end
  
  test "name should be present" do
    @bookmark.name = "   "
    assert_not @bookmark.valid?
  end

  test "url should be present" do
    @bookmark.url = "   "
    assert_not @bookmark.valid?
  end

  test "name should be at most 25 characters" do
    @bookmark.name = "a" * 26
    assert_not @bookmark.valid?
  end
  
  test "order should be most recent first" do
    assert_equal bookmarks(:most_recent), Bookmark.first
  end
end
