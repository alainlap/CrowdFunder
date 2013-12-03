class Transaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :tier

  def qualified_tiers(amount)
    qualified = []
    self.project.tiers.each do |tier|
      qualified << tier.id if amount >= tier.threshold
    end
    qualified 
  end
end
