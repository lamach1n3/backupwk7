class AddAttachmentFileAttachmentToLeads < ActiveRecord::Migration[5.2]
  def self.up
    change_table :leads do |t|
      t.attachment :file_attachment
    end
  end

  def self.down
    remove_attachment :leads, :file_attachment
  end
end
