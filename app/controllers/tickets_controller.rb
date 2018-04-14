class TicketsController < ApplicationController
  before_action :require_user, except: [:show, :index]

  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
    @comment = Comment.new
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.creator = current_user

    if @ticket.save
      flash[:notice] = "Ticket was successfully created!"
      redirect_to ticket_path(@ticket)
    else
      render :new
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])

    if @ticket.update(ticket_params)
      flash[:notice] = "Ticket was successfully updated!"
      redirect_to ticket_path(@ticket)
    else
      render :edit
    end
  end

  def destroy
    Ticket.destroy(params[:id])
    flash[:notice] = "Ticket was successfully destroyed!"
    redirect_to tickets_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:project_id, :name, :body, :status, :user_id, :assignee_id, tag_ids: [])
  end
end
