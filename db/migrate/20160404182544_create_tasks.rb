class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.boolean  :completed, null: false
      t.string   :body, limit: 300, null: false
      t.integer :position, null: false

      t.timestamps null: false
    end
  end
end
