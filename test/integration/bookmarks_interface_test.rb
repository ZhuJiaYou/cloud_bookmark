require 'test_helper'

class BookmarksInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "bookmark interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    # 无效提交
    assert_no_difference 'Bookmark.count' do
      post bookmarks_path, params: { bookmark: { content: "" } }
    end
    assert_select 'div#error_explanation'
    # 有效提交
    content = "This bookmark really ties the room together"
    assert_difference 'Bookmark.count', 1 do
      post bookmarks_path, params: { bookmark: { content: content } }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body
    # 删除一个书签
    assert_select 'a', text: 'delete'
    first_bookmark = @user.bookmarks.paginate(page: 1).first
    assert_difference 'Bookmark.count', -1 do
      delete bookmark_path(first_bookmark)
    end
    # 访问另一个用户的资料页面（没有删除链接）
    get user_path(users(:archer))
    assert_select 'a', text: 'delete', count: 0
  end
end
