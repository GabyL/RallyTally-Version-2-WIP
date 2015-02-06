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
      redirect_to user_event_venue_path # notice "#{@event.title}'s time has been set!"
    else
      render :new
    end
  end

  def show
  end

  def new
    @event = Event.new
  end
end
