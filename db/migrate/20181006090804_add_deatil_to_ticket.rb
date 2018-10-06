class AddDeatilToTicket < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :response_body, :text
    add_column :tickets, :assigned_at, :datetime
  end
end
