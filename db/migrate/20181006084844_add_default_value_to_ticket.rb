class AddDefaultValueToTicket < ActiveRecord::Migration[5.2]
  def up
    change_column :tickets, :reply_status, :boolean, default: false
  end

  def down
    change_column :tickets, :reply_status, :boolean, default: nil
  end

end
