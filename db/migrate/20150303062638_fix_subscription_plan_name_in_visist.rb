class FixSubscriptionPlanNameInVisist < ActiveRecord::Migration
  def change
  	rename_column :visits, :supscriptionPlan, :subscriptionPlan  
  end
end
