
class VenuesController < ApplicationController


  def create
    @venue = Venue.new(event_id: params[:event_id], name: params[:name])
    if @venue.save
      redirect_to new_event_guests_path(event_id: @venue.event_id)
    else
      render :new
    end
  end

  def new
    @venue = Venue.new
  end



end


