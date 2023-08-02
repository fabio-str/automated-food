class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:logout]

  def home
    render layout: 'landing_page'
  end

  def logout
    sign_out(current_user)
    redirect_to root_path
  end

  def page
    @page_key = request.path[1..-1]
    render "pages/#{@page_key}" # TODO: fix rendering of landing page layout instead of application layout
  end
end
