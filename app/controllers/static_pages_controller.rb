class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def not_found
    render :status => 404, :formats => [:html]
  end

  def server_error
    render :status => 500, :formats => [:html]
  end
end
