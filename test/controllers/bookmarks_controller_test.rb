require 'test_helper'

class BookmarksControllerTest < ActionDispatch::IntegrationTest
  def setup
    @bookmark = bookmarks(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Bookmark.count' do
      post bookmarks_path, params: { bookmark: { name: "Lorem", url: "https://bookmarkincloud.herokuapp.com/" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Bookmark.count' do
      delete bookmark_path(@bookmark)
    end
    assert_redirected_to login_url
  end
  
  test "should redirect destroy for wrong bookmark" do
    log_in_as(users(:michael))
    bookmark = bookmarks(:ants)
    assert_no_difference 'Bookmark.count' do
      delete bookmark_path(bookmark)
    end
    assert_redirected_to root_url
  end
end
