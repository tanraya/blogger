class AddImageToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :image, :string, default: nil
  end
end
