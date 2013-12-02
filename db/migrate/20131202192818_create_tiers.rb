class CreateTiers < ActiveRecord::Migration
  def change
    create_table :tiers do |t|
      t.string :project_id
      t.integer :threshold
      t.text :reward_text

      t.timestamps
    end
  end
end
