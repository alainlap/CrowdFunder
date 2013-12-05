class AddAttachmentProjectpictureToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.attachment :projectpicture
    end
  end

  def self.down
    drop_attached_file :projects, :projectpicture
  end
end
