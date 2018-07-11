class AddDescriptionToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :description, :text
  end
end
