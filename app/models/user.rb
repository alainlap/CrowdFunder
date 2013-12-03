class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_attached_file :avatar, 
  									styles: { medium: "300x300>", thumb: "100x100>" }, 
  									default_url: ActionController::Base.helpers.asset_path('placeholder.png')

  # creating a new user
	validates :password, length: { minimum: 3 }, :on => :create
	validates :password, confirmation: true, :on => :create
	validates :email, :username, :password, on: :create, presence: true

	# updating an existing user - but only check this if password is provided
	validates :password, length: { minimum: 3 }, :on => :update, :if => :password_is_present?
	validates :password, confirmation: true, :on => :update, :if => :password_is_present?

  validates :email, :username, uniqueness: true

  has_many :created_projects, class_name: "Project", foreign_key: 'creator_id'
  has_many :transactions
  has_many :sponsored_projects, through: :transactions, class_name: "Project", source: :project
  
  def password_is_present?
  	password.present?
  end

  def username_is_butt?
    username == "butt"
  end
end
