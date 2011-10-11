class Notifier < ActionMailer::Base
  default :from => "online.services@dyha.org"

  def referee_request(request)
    @request = request
    mail(:to => 'timeclass@aol.com', 
          :cc => 'john.kosobud@dyha.org,bob.juby@dyha.org,jacque.gomez@dyha.org,online.services@dyha.org',
          :subject => 'DYHA Referee Request')
  end
  
end
