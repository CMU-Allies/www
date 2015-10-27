class AddAttachmentImageToCommissions < ActiveRecord::Migration
  def self.up
    change_table :commissions do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :commissions, :image
  end
end
