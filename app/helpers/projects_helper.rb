module ProjectsHelper
    require 'sendgrid-ruby'
    include SendGrid
    def sgmail(to, title)
      from = SendGrid::Email.new(email: 'request@taimafrica.com')
      to = SendGrid::Email.new(email: 'mbabaliiryn@gmail.com')
      subject = "Membership request#{title}"
      content = SendGrid::Content.new(type: 'text/plain', value: "Wants to Join your organisation #{title}")

      mail = SendGrid::Mail.new(from, subject, to, content)
      sg = SendGrid::API.new(api_key: ENV['SG_KEY'])
      response = sg.client.mail._('send').post(request_body: mail.to_json)
      puts response.status_code
      puts response.body
      puts response.headers
    end

    # def button(user)
    #     current_user = User.find_by(id: user)
    #     if current_user.project != nil? 
    #         email = current_user.email
    #     end
    #     nil
    # end

    def redirect_to_admin_page
        redirect_to 'admins#index'
    end
end
