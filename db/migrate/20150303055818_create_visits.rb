class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :UserId
      t.string :email
      t.string :name
      t.string :supscriptionPlan
      t.integer :friendCount

      t.timestamps
    end
  end
end
