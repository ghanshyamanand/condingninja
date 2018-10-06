class RemoveColumnFromTicket < ActiveRecord::Migration[5.2]
  def change
    remove_column :tickets, :reply_body
  end
end
