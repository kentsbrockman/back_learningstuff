class CreateJoinTableCourseLearningPath < ActiveRecord::Migration[6.1]
  def change
    create_join_table :courses, :learning_paths do |t|
      # t.index [:course_id, :learning_path_id]
      # t.index [:learning_path_id, :course_id]
    end
  end
end
