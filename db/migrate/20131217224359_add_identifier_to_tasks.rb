class AddIdentifierToTasks < ActiveRecord::Migration
  def change
    change_table :tasks do |t|
      t.string :identifier
    end    
  end
end
