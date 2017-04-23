class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.references :list, foreign_key: true
      t.string :text
      t.boolean :active

      t.timestamps
    end
  end
end
