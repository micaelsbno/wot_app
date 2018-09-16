class Api::EventsController < ApplicationController
  
  def update_events
    times = EventTime.where('start_time > ?', Time.now).sort_by{|time| time.start_time }
    @events = []
    event = times.map do | time | {event: time.event, place: time.event.place, time: time} end
    event.each do |event|
      unless @events.map{|ev| ev[:place][:name]}.include?(event[:place][:name])
        @events << event
      end
    end
    render json: @events 
  end

end