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
      post bookmarks_path, params: { bookmark: { name: "", url: "" } }
    end
    assert_select 'div#error_explanation'
    # 有效提交
    name = "QQ"
    url = "http://www.qq.com"
    assert_difference 'Bookmark.count', 1 do
      post bookmarks_path, params: { bookmark: { name: name, url: url } }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match name, response.body
    assert_match url, response.body
    # 删除一个书签
    assert_select 'a', text: 'DEL'
    first_bookmark = @user.bookmarks.paginate(page: 1).first
    assert_difference 'Bookmark.count', -1 do
      delete bookmark_path(first_bookmark)
    end
    # 访问另一个用户的资料页面（没有删除链接）
    get user_path(users(:archer))
    assert_select 'a', text: 'DEL', count: 0
  end
end
