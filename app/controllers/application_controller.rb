class ApplicationController < ActionController::Base
  require "awesome_print"
  protect_from_forgery with: :exception
end
