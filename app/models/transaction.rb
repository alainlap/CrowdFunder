class Transaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :tier

  def qualified_tiers(project, amount)
    qualified = []
    project.tiers.each do |tier|
      qualified << tier if amount >= tier.threshold && tier.qty_remaining > 0
    end
    qualified 
  end
end
