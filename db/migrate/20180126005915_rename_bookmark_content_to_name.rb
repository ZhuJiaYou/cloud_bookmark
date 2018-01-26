class RenameBookmarkContentToName < ActiveRecord::Migration[5.1]
  def change
    rename_column :bookmarks, :content, :name
  end
end
