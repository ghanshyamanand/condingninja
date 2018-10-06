class TicketsController < ApplicationController
  # before_action :authenticate_agent!

  skip_before_action :verify_authenticity_token

  def inbox
    request_body = request.body.read
    response_body = Mail.read_from_string(request_body)
    subject = response_body.subject
    from_email = response_body.from.first
    message_body = response_body.multipart? ? response_body.text_part.body.to_s : response_body.body.decoded
    Ticket.create_new_ticket(request_body, subject, from_email, message_body)
  end
end
