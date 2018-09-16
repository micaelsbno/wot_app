class EventsController < ApplicationController
  
  def index
    @google_map_loader = HTTParty.get("https://maps.googleapis.com/maps/api/js?key=#{ENV['GOOGLE_MAPS_KEY']}&callback=initMap")
      times = EventTime.where('start_time > ?', Time.now).sort_by{|time| time.start_time }
      @events = []
      event = times.map do | time | {event: time.event, place: time.event.place, time: time} end
      event.each do |event|
        unless @events.map{|ev| ev[:place][:name]}.include?(event[:place][:name])
          @events << event
        end
      end
    render :index
  end

  def show
    @event = Event.find_by(id: params[:id])
    @time = @event.event_times
    @place = @event.place
    render :show
  end

end