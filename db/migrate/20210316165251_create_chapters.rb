class CreateChapters < ActiveRecord::Migration[6.1]
  def change
    create_table :chapters do |t|
      t.references :course, null: false, foreign_key: true
      t.integer :position
      t.string :title

      t.timestamps
    end
  end
end
