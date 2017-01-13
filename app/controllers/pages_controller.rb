class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
  end

  def tables
    @tables = ChatRoom.all
  end
end
