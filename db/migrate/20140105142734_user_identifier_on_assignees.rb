class UserIdentifierOnAssignees < ActiveRecord::Migration
  def change
    change_table :assignees do |t|
      t.string :user_identifier
    end
  end
end