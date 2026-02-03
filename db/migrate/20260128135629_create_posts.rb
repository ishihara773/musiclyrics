class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|

      t.timestamps
      t.string :title
      t.string :text
      t.string :location
    end
  end
end
