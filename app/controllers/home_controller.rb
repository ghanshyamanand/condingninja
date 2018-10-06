class HomeController < ApplicationController
  before_action :authenticate_agent!

  def index
  end
end
