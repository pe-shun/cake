class ApplicationController < ActionController::Base

  before_action :customer_state, only: [:create]


end