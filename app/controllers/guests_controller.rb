class GuestsController < ApplicationController


  def create
    @guest = Guest.new(
      event_id: params[:event_id], 
      name: params[:name], 
      phone: params[:phone]
      )
    
    if @guest.save
      redirect_to new_event_guests_path(event_id: @guest.event_id)
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
