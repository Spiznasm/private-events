class EventsController < ApplicationController

	def new
    @event = Event.new
	end

	def create
    @user = current_user
    @event = @user.hosted_events.build(event_params)
    if @event.save
      flash[:success] = "Event Created"
      redirect_to event_path(@event)
    else
      render 'new'
    end
	end

	def edit
    @event = Event.find(params[:id])
	end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = "Event Updated"
      redirect_to event_path(@event)
    else
      render 'edit'
    end
  end

	def index
    
	end

	def show
    @event = Event.find(params[:id])
	end

  private 

  def event_params
    params.require(:event).permit(:name, :date, :location, :description)
  end
end
