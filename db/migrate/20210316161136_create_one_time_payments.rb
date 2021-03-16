class CreateOneTimePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :one_time_payments do |t|
      t.references :subscription, null: false, foreign_key: true
      t.integer :total_amount, null: false
      t.string :product_stripe_id

      t.timestamps
    end
  end
end
