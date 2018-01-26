class RenameBookmarkUrlToUrl < ActiveRecord::Migration[5.1]
  def change
    rename_column :bookmarks, :URL, :url
  end
end
