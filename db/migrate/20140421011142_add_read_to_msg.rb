class AddReadToMsg < ActiveRecord::Migration
  def change
    add_column :msgs, :read, :integer, :default=>0
  end
end
