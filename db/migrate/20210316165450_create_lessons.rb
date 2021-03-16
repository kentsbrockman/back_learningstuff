class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.references :chapter, null: false, foreign_key: true
      t.integer :position
      t.string :title

      t.timestamps
    end
  end
end
