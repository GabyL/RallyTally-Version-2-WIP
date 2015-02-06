class VenuesController < ApplicationController

  def index
    render :venues
  end


  def create
    @venue = Venue.new(params)
    if @venue.save
      redirect_to user_event_guests_path
    else
      render :new
    end
  end

  def new
    @venue = Venue.new
  end

end


