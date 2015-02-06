class VenuesController < ApplicationController


  def create
    @venue = Venue.new(params[:event_id])
    if @venue.save
      redirect_to user_event_guests_path
    else
      render :new
    end
  end

  def new
    @venue = Venue.new
  end


  protected

  def venue_params
    params.require(:venue).permit(:event_id)
  end

end


