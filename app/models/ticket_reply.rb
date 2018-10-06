class TicketReply < ApplicationRecord
  belongs_to :ticket_reply, optional: true
end

# == Schema Information
#
# Table name: ticket_replies
#
#  id         :integer          not null, primary key
#  body       :text
#  from_email :string
#  ticket_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
