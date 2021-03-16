class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.references :student, null: false, foreign_key: true
      t.references :learning_path, null: false, foreign_key: true
      t.references :one_time_payment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
