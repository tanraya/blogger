class AddImageToDownloadToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :image_to_download, :text, null: false
  end
end
