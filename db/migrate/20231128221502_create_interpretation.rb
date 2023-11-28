class CreateInterpretation < ActiveRecord::Migration[7.0]
  def change
    create_table :interpretations do |t|
      t.string :interpretation_content
      t.references :dream, null: false, foreign_key: true

      t.timestamps
    end
  end
end
