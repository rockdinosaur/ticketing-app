class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @ticket = Ticket.find(params[:ticket_id])
    @comment = @ticket.comments.build(comment_params)
    @comment.creator = current_user

    if @comment.save
      flash[:notice] = "Comment created successfully!"
      Ticket.find(params[:ticket_id]).update(status: params[:status]) if params[:status].present?
      redirect_to ticket_path(@ticket)
    else
      render :new
    end
  end

  def edit
    @ticket = Ticket.find(params[:ticket_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:ticket_id])
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      flash[:notice] = "Comment updated successfully!"
      Ticket.find(params[:ticket_id]).update(status: params[:status]) if params[:status].present?
      redirect_to ticket_path(@ticket)
    else
      render :edit
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :ticket_id)
  end
end
