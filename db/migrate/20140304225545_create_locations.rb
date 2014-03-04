class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :phone
      t.string :website
      t.string :hours
      t.boolean :kid_friendly
      t.string :street_address
      t.string :city
      t.string :state
      t.string :postal_code
      t.decimal :latitude, {precision: 10, scale: 6}
      t.decimal :longitude, {precision: 10, scale: 6}
      t.timestamps
    end
  end
end
