class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to event_path
    else
      render "edit"
    end
  end

  def destroy
    @event.destroy
    redirect_to @event  
  end
  

  private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:artista, :fecha_evento, :descripcion, :fecha_cierre)
    end  
end
