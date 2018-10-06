class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :subject
      t.string :from_email
      t.text :body
      t.text :reply_body
      t.boolean :reply_status
      t.integer :agent_id

      t.timestamps
    end
  end
end
