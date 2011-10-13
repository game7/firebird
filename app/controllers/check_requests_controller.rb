class CheckRequestsController < ApplicationController
  
  def index
  end

  def new
    @check_request = CheckRequest.new
  end

  def create
    @check_request = CheckRequest.new(params[:check_request])
    if @check_request.valid?
      Notifier.check_request(@check_request).deliver
      redirect_to check_requests_path, :notice => 'Check Request has been submitted'
    else
      render :action => "new"
    end
  end


end
