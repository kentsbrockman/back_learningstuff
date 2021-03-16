class CreateJoinTableCategoryLearningPath < ActiveRecord::Migration[6.1]
  def change
    create_join_table :categories, :learning_paths do |t|
      # t.index [:category_id, :learning_path_id]
      # t.index [:learning_path_id, :category_id]
    end
  end
end
