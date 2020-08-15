module ProjectsHelper
    require 'sendgrid-ruby'
    include SendGrid
    def sgmail(to, title)
      from = SendGrid::Email.new(email: 'nyatindopatrick@gmail.com')
      to = SendGrid::Email.new(email: to)
      subject = "Membership request#{title}"
      content = SendGrid::Content.new(type: 'text/plain', value: "My project details #{title}.
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
