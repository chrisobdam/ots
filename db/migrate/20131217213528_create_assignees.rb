class CreateAssignees < ActiveRecord::Migration
  def change
    create_table :assignees do |t|
      t.integer :task_id
      t.integer :user_id
      t.string :status
    end
  end
end
