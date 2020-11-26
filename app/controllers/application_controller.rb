class ApplicationController < ActionController::Base
  before_action :authenticate_conta!
  def index
  end
end
