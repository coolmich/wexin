class ChangeReceiverIdToUidInMsg < ActiveRecord::Migration
  def change
    rename_column :msgs, :receiver_id, :receiver_uid
    change_column :msgs, :receiver_uid, :string
  end
end
