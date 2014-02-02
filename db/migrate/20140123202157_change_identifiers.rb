class ChangeIdentifiers < ActiveRecord::Migration
  def change
    add_column :listeners, :user, :string
    remove_column :listeners, :user_id
  end
end