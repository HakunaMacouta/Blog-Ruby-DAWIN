class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :lead
      t.string :thumbnail

      t.timestamps
    end
  end
end
