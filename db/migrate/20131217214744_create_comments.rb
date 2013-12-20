class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment
      t.integer :index
      t.integer :task_id
      t.integer :author_id
      t.datetime :date
      t.timestamps
    end
  end
end
