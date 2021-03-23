class AddResultProgressState < ActiveRecord::Migration[6.1]
  def change
    drop_table :lessons_progress_states

    create_table :progress_lessons do |t|
      t.references :lesson, null: false, foreign_key: true
      t.references :progress_state, null: false, foreign_key: true
      t.string :quizz_result

      t.timestamps
    end
  end
end
