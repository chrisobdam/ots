class RenameUserIdentifierAssignee < ActiveRecord::Migration
  def change
    rename_column :assignees, :user_identifier, :identifier
  end
end