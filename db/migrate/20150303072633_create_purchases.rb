class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :userId
      t.float :revenue
      t.string :shippingMethod

      t.timestamps
    end
  end
end
