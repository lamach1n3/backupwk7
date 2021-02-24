class RemoveFileAttachmentFromLeads < ActiveRecord::Migration[5.2]
  def change
    remove_column :leads, :file_attachment, :binary
  end
end
