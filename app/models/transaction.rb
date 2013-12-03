class Transaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :tier

  def qualified_tiers(amount)
    qualified = []
    self.project.tiers.each do |tier|
      qualified << tier if amount >= tier.threshold && tier.qty_remaining > 0
    end
    qualified 
  end
end
