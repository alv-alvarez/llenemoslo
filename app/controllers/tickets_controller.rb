class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show]
  
  def index
    @tickets = Ticket.where(user_id: current_user.id)
  end

  def show

  end
    
  def new
    @evento = Event.find(params[:event_id])
    @ticket = @evento.tickets.new
  end

  def create
    logger.info params.inspect
    @ticket = Ticket.new(params.require(:ticket).permit(:apuesta));
    @ticket.user = current_user
    @ticket.event = Event.find(params[:event_id])
    @ticket.save
    # respond_to do |format|
    #   if @ticket.save
    #     format.html { redirect_to @event, notice: 'Su apuesta ha sido creada.' }
    #     format.json { render action: 'show', status: :created, location: @ticket }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @ticket.errors, status: :unprocessable_entity }
    #   end 
    # end
  end

  private
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def ticket_params()
      params.require(:ticket).permit(:apuesta, :user_id, :event_id)
    end  
end