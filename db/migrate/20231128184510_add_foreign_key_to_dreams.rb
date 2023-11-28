class AddForeignKeyToDreams < ActiveRecord::Migration[7.0]
  def change
    add_column :dreams, :user_id, :integer 
    add_foreign_key :dreams, :users, column: :user_id
  end
end
