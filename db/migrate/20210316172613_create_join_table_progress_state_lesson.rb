class CreateJoinTableProgressStateLesson < ActiveRecord::Migration[6.1]
  def change
    create_join_table :lessons, :progress_states do |t|
      # t.index [:lesson_id, :progress_state_id]
      # t.index [:progress_state_id, :lesson_id]
    end
  end
end
