class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :purchase_id
      t.string :item

      t.timestamps

    end
  end
end
