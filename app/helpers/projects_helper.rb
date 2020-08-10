module ProjectsHelper
    require 'sendgrid-ruby'
    include SendGrid
    def sgmail(to, title)
      from = SendGrid::Email.new(email: 'mbabaliiryn@gmail.com')
      to = SendGrid::Email.new(email: to)
      subject = "Request To #{title}"
      content = SendGrid::Content.new(type: 'text/plain', value: "Membership request for #{title}.
      to join your Organisation")
      mail = SendGrid::Mail.new(from, subject, to, content)
      sg = SendGrid::API.new(api_key: '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')
      response = sg.client.mail._('send').post(request_body: mail.to_json)
      puts response.status_code
      puts response.body
      puts response.headers
    end

    def button(user)
        current_user = User.find_by(id: user)
        if current_user.project != nil? 
            email = current_user.email
        end
        nil
    end
end
