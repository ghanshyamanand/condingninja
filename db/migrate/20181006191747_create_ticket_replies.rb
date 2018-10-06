class CreateTicketReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :ticket_replies do |t|
      t.text :body
      t.string :from_email
      t.integer :ticket_id

      t.timestamps
    end
  end
end
