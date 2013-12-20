class AddTokenToAssignee < ActiveRecord::Migration
  def change
    change_table :assignees do |t|
      t.string :token
    end    
  end
end
