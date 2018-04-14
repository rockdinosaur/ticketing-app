class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :meets_search_criteria?, :logged_in_as_creator?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:error] = "Must be logged in to do that!"
      redirect_to root_path
    end
  end

  def logged_in_as_creator?(obj)
    logged_in? && current_user.id == obj.creator.id
  end

  def meets_search_criteria?(ticket)
    (params[:project].blank? || params[:project].to_i == ticket.project.id) &&
    (params[:status].blank? || params[:status] == ticket.status) &&
    (params[:tag].blank? || ticket.tags.map { |tag| tag.id }.include?(params[:tag].to_i))
  end
end
