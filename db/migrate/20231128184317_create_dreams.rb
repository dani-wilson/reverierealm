class CreateDreams < ActiveRecord::Migration[7.0]
  def change
    create_table :dreams do |t|
      t.string :dream_title
      t.string :dream_content
      t.string :dream_date
      t.integer :privacy_setting, default: 0
      t.boolean :favorite
      t.string :additional_insights

      t.timestamps
    end
  end
end
