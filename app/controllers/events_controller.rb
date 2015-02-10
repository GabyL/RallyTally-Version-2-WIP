require 'pry'

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

    year = Time.now.year
    month = Time.now.month
    day = Time.now.day

    time = "#{year}-#{month}-#{day} #{hour}:#{minutes}:#00 +0000".to_datetime

    title = params[:event][:title]
    @event = Event.new(title: title, time: time, user_id: current_user.id)
    if @event.save
      redirect_to new_event_venues_path(event_id: @event.id)
    else
      render :new
    end
  end

  def show
    render :show
  end

  def new
    @event = Event.new
  end

  def confirmation
    render :confirmation
  end

  def details
    @event = Event.where(id: params[:event_id]).first
    render :details
  end  

end
