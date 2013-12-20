class ModifyTasksOwner < ActiveRecord::Migration
  def change
    change_table :tasks do |t|
      t.remove :owner
    end    
  end
end
