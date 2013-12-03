class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, :username, uniqueness: true

  has_many :created_projects, class_name: "Project"
  has_many :transactions
  has_many :sponsored_projects, through: :transactions, class_name: "Project", source: :project
  
end
