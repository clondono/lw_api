class ChangeStitleToTitle < ActiveRecord::Migration
  def change
  	rename_column :page_views, :stitle, :title
  end
end
