class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.integer :author_id
      t.integer :assignee_id
      t.string :state
      t.datetime :expired_at

      t.timestamps
    end
  end
end
