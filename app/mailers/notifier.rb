class Notifier < ActionMailer::Base
  default :from => "online.services@dyha.org"

  def referee_request(request)
    @request = request
    mail(:to => 'timeclass@aol.com', 
          :cc => 'refs@dyha.org',
          :subject => 'DYHA Referee Request')
  end
  
end
