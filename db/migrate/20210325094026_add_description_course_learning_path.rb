class AddDescriptionCourseLearningPath < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :description, :text
    add_column :learning_paths, :description, :text
    add_column :courses, :slug, :string
    add_column :learning_paths, :slug, :string
  end
end
