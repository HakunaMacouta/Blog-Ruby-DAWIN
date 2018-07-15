class AddThumbnailToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :thumbnail, :string
  end
end
