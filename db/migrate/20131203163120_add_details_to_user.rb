class AddDetailsToUser < ActiveRecord::Migration
	def up
		add_column :users, :first_name, :string
		add_column :users, :last_name, :string
		add_column :users, :street_address, :string
		add_column :users, :city, :string
		add_column :users, :province, :string
		add_column :users, :postal_code, :string
		add_column :users, :phone_number, :string
		add_attachment :users, :avatar
	end

	def down
		remove_column :users, :first_name, :string
		remove_column :users, :last_name, :string
		remove_column :users, :street_address, :string
		remove_column :users, :city, :string
		remove_column :users, :province, :string
		remove_column :users, :postal_code, :string
		remove_column :users, :phone_number, :string
		remove_attachment :users, :avatar

	end
end
