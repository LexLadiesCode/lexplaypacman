class AddEmailToStandings < ActiveRecord::Migration
  def change
    add_column :standings, :email, :string
    add_column :standings, :twitter, :string
  end
end
