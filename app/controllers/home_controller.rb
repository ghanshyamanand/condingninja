class HomeController < ApplicationController
  before_action :authenticate_agent!

  def index
    @tickets = current_agent.tickets
  end
end
