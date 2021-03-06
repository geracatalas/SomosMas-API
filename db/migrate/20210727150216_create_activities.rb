class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :name, null: false
      t.text :content, null: false
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :activities, :deleted_at
  end
end
