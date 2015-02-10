require 'pry'

class GuestsController < ApplicationController


  def create
    name = params[:guest][:name]
    phone = params[:guest][:phone]

    @guest = Guest.new(
      name: name, 
      phone: phone
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
