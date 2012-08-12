class FreeAgentsController < ApplicationController
  def index
  end

  def new
    @free_agent = FreeAgent.new
  end

  def create
    @free_agent = FreeAgent.new(params[:free_agent])
    if @free_agent.valid?
      Notifier.free_agent(@free_agent).deliver
      redirect_to free_agents_path, :notice => 'Free Agent Request has been submitted'
    else
      render :action => "new"
    end    
  end

end
