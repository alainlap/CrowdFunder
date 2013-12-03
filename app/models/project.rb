class Project < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :sponsors, through: :transactions, class_name: "User", source: :user
  has_many :tiers
  accepts_nested_attributes_for :tiers
  has_many :transactions

  def sum_raised
    total = 0
    self.transactions.each do |pledge|
      total += pledge.dollar_amount if pledge.dollar_amount
    end
    total
  end

  def percentage_raised
    sum_raised / self.goal
  end

  def number_of_backers
    self.transactions.select{|transaction| !transaction.dollar_amount.nil?}.size
  end
end

