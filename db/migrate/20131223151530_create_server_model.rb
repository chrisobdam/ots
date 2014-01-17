class CreateServerModel < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :domain
    end
  end
end
