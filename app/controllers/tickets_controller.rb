class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = Ticket.new
  end

  def create
    binding.pry
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      flash[:notice] = "Ticket was successfully created!"
      redirect_to ticket_path(@ticket)
    else
      render :new
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:project_id, :name, :body, :status, tag_ids: [])
  end
end
