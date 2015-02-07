class GuestsController < ApplicationController


  def create
    @guest = Guest.new(
      name: params[:name], 
      phone: params[:phone]
      )
    
    if @guest.save
      @guest.invitations.create(event_id: params[:event_id])
      redirect_to event_confirmation_path(event_id: params[:event_id])
    else
      render :new
    end
  end

  def new
    @guest = Guest.new
  end


  protected

  def venue_params
    params.require(:guest).permit(:event_id) # y no name?
  end


end
