class CreateStandings < ActiveRecord::Migration
  def change
    create_table :standings do |t|
      t.string :initials
      t.integer :score
      t.references :player, index: true
      t.references :location

      t.timestamps
    end
  end
end
