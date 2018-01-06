class AddPictureToBookmarks < ActiveRecord::Migration[5.1]
  def change
    add_column :bookmarks, :picture, :string
  end
end
