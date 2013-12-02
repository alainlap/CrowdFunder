class Tier < ActiveRecord::Base
  belongs_to :project
  has_many :transactions
end
