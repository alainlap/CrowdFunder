class Project < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :sponsors, through: :transactions, class_name: "User", source: :user
  has_many :tiers
  accepts_nested_attributes_for :tiers
end
