require_relative '20140413000713_add_user_id_to_msg.rb'
class AddReceiverToMsg < ActiveRecord::Migration
  def change
    revert AddUserIdToMsg
    add_column :msgs, :receiver_id, :integer
    add_column :msgs, :user_id, :integer
  end
end
