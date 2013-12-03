class Project < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :sponsors, through: :transactions, class_name: "User", source: :user
  has_many :tiers
  accepts_nested_attributes_for :tiers

  def sum_raised
    total = 0
    self.transactions.each do |pledge|
      total += pledge.dollaramount
    end
    total
  end

  def percentage_raised
    sum_raised / self.goal
  end
end
