class RefereeRequestsController < ApplicationController

  def index
  end

  def new
    @referee_request = RefereeRequest.new
    puts @referee_request.class
  end

  def create
    @referee_request = RefereeRequest.new(params[:referee_request])
    if @referee_request.valid?
      Notifier.referee_request(@referee_request).deliver
      redirect_to referee_requests_path, :notice => 'Referee Request has been submitted'
    else
      render :action => "new"
    end
  end


end
