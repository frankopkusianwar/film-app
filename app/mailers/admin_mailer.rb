class AdminMailer < ApplicationMailer
    default from: 'from@example.com'
    layout 'mailer'

    def new_user_waiting_for_approval(email)
      @email = email
      mail(to: 'mbabaliiryn@gmail.com', subject: 'New User Awaiting Admin Approval')
    end
end
