class VenuesController < ApplicationController


  def create
    @venue = Venue.new(params)
    if @venue.save
      redirect_to user_event_guests_path
    else
      render :new
    end
  end

  def new
    
  end

end


