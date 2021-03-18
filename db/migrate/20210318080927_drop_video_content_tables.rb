class DropVideoContentTables < ActiveRecord::Migration[6.1]
  def change
    drop_table :lesson_videos
    drop_table :lesson_contents
    add_column :lessons, :content, :text
    add_column :lessons, :video_url, :string
  end
end
