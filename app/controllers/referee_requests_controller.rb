class RefereeRequestsController < ApplicationController

  def new
    @referee_request = RefereeRequest.new
  end

  def create
    @referee_request = RefereeRequest.new(params[:referee_request])
    if @referee_request.valid?
    else
      render :action => "new"
    end
  end

end
