class EventsController < ApplicationController

  def index
    render :index
  end


  def create

    hour = params[:hour].to_i
    minutes = params[:minutes].to_i

    if params[:am_pm] == '12'
      hour += 12
    end

    time = "#{hour}:#{minutes}:00 +0000".to_datetime

    title = params[:title]

    @event = Event.new(title: title, time: time)
    if @event.save
      redirect_to new_event_venues_path(event_id: @event.id)

    else
      render :new
    end
  end

  def show
    render :index
  end

  def new
    @event = Event.new
  end

  def confirmation
    render :confirmation
  end



end
