# Purpose: This is the parent class for all mailers. It is responsible for setting the default from address and the layout for all mailers.
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
