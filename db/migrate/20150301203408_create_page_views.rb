class CreatePageViews < ActiveRecord::Migration
  def change
    create_table :page_views do |t|
      t.string :userID
      t.string :path
      t.string :referrer
      t.string :stitle
      t.string :url

      t.timestamps
    end
  end
end
