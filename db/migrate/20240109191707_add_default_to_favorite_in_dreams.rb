class AddDefaultToFavoriteInDreams < ActiveRecord::Migration[7.0]
  def change
    change_column :dreams, :favorite, :boolean, default: false
  end
end
