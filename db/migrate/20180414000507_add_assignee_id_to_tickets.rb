class AddAssigneeIdToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :assignee_id, :integer
  end
end
