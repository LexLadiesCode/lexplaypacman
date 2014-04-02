class AddImageUrlToStandings < ActiveRecord::Migration
  def change
    add_column :standings, :image_URL, :string
  end
end
