class CreateUsersFirst < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :identifier
      t.timestamps
    end
  end
end
