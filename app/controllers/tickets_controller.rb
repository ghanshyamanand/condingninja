class TicketsController < ApplicationController
  before_action :authenticate_agent!,  only: [:detail]
  before_action :check_ticket,  only: [:detail, :reply]

  before_action :check_user_ticket,  only: [:detail]


  skip_before_action :verify_authenticity_token

  def inbox
    request_body = request.body.read
    response_body = Mail.read_from_string(request_body)
    subject = response_body.subject
    from_email = response_body.from.first
    message_body = response_body.multipart? ? response_body.text_part.body.to_s : response_body.body.decoded
    Ticket.create_new_ticket(request_body, subject, from_email, message_body)
  end

  def detail
  end

  def reply
    reply_body = params[:reply_body]
    mail = Mail.read_from_string(@ticket.response_body)
    new_mail = mail.reply
    new_mail = mail.reply do
      text_part do
        body reply_body
      end
    end
    @ticket.send_and_save_reply(reply_body, new_mail, current_agent)
    redirect_to home_index_path, notice: "Thanks for your reply."
  end

  private

    def check_ticket
      @ticket = Ticket.find_by_id params[:id]
      unless @ticket.present?
        redirect_to home_index_path, alert: "No ticket present."
      end
    end

    def check_user_ticket
      @ticket = Ticket.find_by_id params[:id]
      unless @ticket.agent_id == current_agent.id
        redirect_to home_index_path, alert: "You are not assigned to this ticket."
      end
    end


end
