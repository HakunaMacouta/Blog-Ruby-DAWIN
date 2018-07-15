class AddContentToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :content, :string
    remove_column :posts, :thumbnail
  end
end
