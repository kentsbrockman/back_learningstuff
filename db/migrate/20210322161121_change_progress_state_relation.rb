class ChangeProgressStateRelation < ActiveRecord::Migration[6.1]
  def change
    remove_reference :progress_states,
                     :subscription,
                     null: false,
                     foreign_key: true
    add_reference :progress_states, :user, null: false, foreign_key: true
  end
end
