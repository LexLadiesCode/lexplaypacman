class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :email
      t.string :twitter
      t.string :last_ip_address
      t.boolean :is_banned

      t.timestamps
    end
  end
end
