class Notifier < ActionMailer::Base
  default :from => "online.services@dyha.org"

  def referee_request(request)
    @key = random_key
    @request = request
    mail(:to => 'timeclass@aol.com', 
          :cc => 'refs@dyha.org',
          :subject => "DYHA Referee Request ##{@key}")
  end
  
  def check_request(request)
    @key = random_key
    @request = request
    mail(:to => request.email,
          :bcc => 'checkrequest@dyha.org',
          :subject => "DYHA Check Request ##{@key}",
          :template_name => "check_request_confirmation")
  end
  
  def free_agent(request)
    to = "adam.mims@oceansideicearena.net, brad.priest@oceansideicearena.net, jarred.smith@oceansideicearena.net"
    @request = request
    mail(:to => to,
          :cc => "#{request.email}",
          :bcc => "cmwoodall@game7.net",
          :subject => "OAHL Free Agent Request for #{request.name}")
  end  
  
  def random_key(size=6)
    chars = ('A'..'Z').to_a
    (0...size).collect{ chars[Kernel.rand(chars.length)] }.join
  end
  
end
