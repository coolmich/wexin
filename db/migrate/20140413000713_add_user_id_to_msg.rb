class AddUserIdToMsg < ActiveRecord::Migration
  def change
    add_column :msgs, :user_id, :string
  end
end
