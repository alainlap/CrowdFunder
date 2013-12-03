class AddInitialQuantityToTiers < ActiveRecord::Migration
  def change
    add_column :tiers, :initial_quantity, :integer
  end
end
