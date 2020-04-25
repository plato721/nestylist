class CreateShopItems < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_items do |t|
      t.references :item, foreign_key: true
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
