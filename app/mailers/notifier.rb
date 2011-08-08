class Notifier < ActionMailer::Base
  default :from => "online.services@dyha.org"

  def referee_request(request)
    @request = request
    mail(:to => 'cmwoodall@game7.net', 
          :cc => 'john.kosobud@dyha.org',
          :subject => 'DYHA Referee Request')
  end
end
