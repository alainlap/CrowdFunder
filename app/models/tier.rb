class Tier < ActiveRecord::Base
  belongs_to :project
  has_many :transactions

  def qty_remaining
    self.initial_quantity - self.transactions.size
  end
end
