class MoveColumnExplanationsQuestion < ActiveRecord::Migration[6.1]
  def change
    remove_column :answers, :explanation, :string
    add_column :questions, :explanation, :string
  end
end
