class CreateTasksNew < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :notes
      t.datetime :due_date
      t.string :owner
      t.text :listeners
      t.timestamps
    end
  end
end
