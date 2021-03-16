class CreateLessonVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :lesson_videos do |t|
      t.string :url
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end
