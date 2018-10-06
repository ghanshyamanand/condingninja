ActiveAdmin.register Ticket do
  permit_params :subject, :from_email, :body, :reply_status, :agent_id
  form do |f|
    f.inputs do
      f.input :subject
      f.input :from_email
      f.input :body
      f.input :reply_status
      f.input :agent_id, :label => 'Agent', :as => :select, :collection => ( Agent.pluck(:email, :id) )
    end
    f.actions
  end

  index do
    id_column
    column :subject
    column :from_email
    column :agent
    column :reply_status
    column :assigned_at
    actions
  end

end
