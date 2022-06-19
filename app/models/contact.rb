class Contact < MailForm::Base
  attribute :first_name,      validate: true
  attribute :last_name,      validate: true
  attribute :email,     validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname,  captcha: true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Contact Form Inquiry",
      :to => "ahlonko.kowouvi@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end
