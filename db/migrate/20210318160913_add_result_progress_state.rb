class AddResultProgressState < ActiveRecord::Migration[6.1]
  def change
    add_column :lessons_progress_states, :quizz_result, :string
  end
end
