class Notifier < ActionMailer::Base
  default :from => "online.services@dyha.org"

  def referee_request(request)
    @request = request
    mail(:to => 'cmwoodall@yahoo.com', :subject => 'DYHA Referee Request')
  end
end
