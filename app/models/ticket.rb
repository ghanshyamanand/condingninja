class Ticket < ApplicationRecord

  validates :subject,
            :from_email,
            :body,
            presence: true



  belongs_to :agent, optional: true
  has_many :ticket_replies, dependent: :destroy

  before_save :set_assigned_at, if: lambda{|ticket| ticket.agent_id.present? }

  def self.create_new_ticket(request_body, subject, from_email, message_body)
    ticket = self.new
    ticket.response_body = request_body
    ticket.subject = subject
    ticket.from_email = from_email
    ticket.body = message_body
    ticket.save!
  end

  def set_assigned_at
    self.assigned_at = Time.now
  end

  def send_and_save_reply(reply_body, new_mail, current_agent)
    if new_mail.deliver!
      ticket_reply = ticket_replies.new
      ticket_reply.body = reply_body
      ticket_reply.from_email = current_agent.email
      self.update(reply_status: true) if ticket_reply.save
    end
  end
end

# == Schema Information
#
# Table name: tickets
#
#  id            :integer          not null, primary key
#  subject       :string
#  from_email    :string
#  body          :text
#  reply_body    :text
#  reply_status  :boolean          default(FALSE)
#  agent_id      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  response_body :text
#  assigned_at   :datetime
#
