class ModifyTasks < ActiveRecord::Migration
  def change
    change_table :tasks do |t|
      t.remove :listeners
      t.integer :owner_id
    end    
  end
end
