class RemoveEmailAndTwitterFromStandings < ActiveRecord::Migration
  def change
    remove_column :standings, :email, :string
    remove_column :standings, :twitter, :string
  end
end
