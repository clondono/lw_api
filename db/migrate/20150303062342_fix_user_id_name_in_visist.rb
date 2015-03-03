class FixUserIdNameInVisist < ActiveRecord::Migration
  def change
  	rename_column :visits, :UserId, :userId
  end
end
