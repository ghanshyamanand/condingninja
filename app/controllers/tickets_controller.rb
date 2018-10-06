class TicketsController < ApplicationController
  before_action :authenticate_agent!
end
