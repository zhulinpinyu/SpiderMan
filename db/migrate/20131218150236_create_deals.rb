class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :name
      t.string :price
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
