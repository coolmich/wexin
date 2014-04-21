class AddSecretNumberToMsg < ActiveRecord::Migration
  def change
    add_column :msgs, :secret, :int
  end
end
