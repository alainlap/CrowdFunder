class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :goal
      t.integer :user_id
      t.text :description
      t.string :img
      t.date :end_date
      t.integer :min_pledge
      t.string :website

      t.timestamps
    end
  end
end
