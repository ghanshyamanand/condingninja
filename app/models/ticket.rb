class Ticket < ApplicationRecord
end

# == Schema Information
#
# Table name: tickets
#
#  id           :integer          not null, primary key
#  subject      :string
#  from_email   :string
#  body         :text
#  reply_body   :text
#  reply_status :boolean
#  agent_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
