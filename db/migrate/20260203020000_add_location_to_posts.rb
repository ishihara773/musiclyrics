class AddLocationToPosts < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:posts, :location)
      add_column :posts, :location, :string
    end
  end
end