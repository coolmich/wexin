class CreateMsgs < ActiveRecord::Migration
  def change
    create_table :msgs do |t|
      t.text :content
      t.string :phone
      t.timestamps
    end
  end
end
