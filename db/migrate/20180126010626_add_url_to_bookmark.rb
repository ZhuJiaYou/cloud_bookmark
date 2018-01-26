class AddUrlToBookmark < ActiveRecord::Migration[5.1]
  def change
    add_column :bookmarks, :URL, :string
  end
end
