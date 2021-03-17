class AddFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :is_approved, :boolean, default: false
    add_column :users, :is_reviewed, :boolean, default: false
    add_column :users, :role, :string, default: 'student'
    add_column :users, :description, :text
    add_column :users, :linkedin_address, :string
    add_column :users, :job, :string
    add_column :users, :customer_stripe_id, :string
  end
end
