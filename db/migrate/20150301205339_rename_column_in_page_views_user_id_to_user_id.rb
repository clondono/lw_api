class RenameColumnInPageViewsUserIdToUserId < ActiveRecord::Migration
  def change
  	rename_column :page_views, :userID, :userId

  end
end
