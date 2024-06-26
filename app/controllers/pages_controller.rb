class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:logout]

  def lp
    render layout: 'landing_page'
  end

  def logout
    sign_out(current_user)
    render "pages/lp"
  end

  def page
    @page_key = request.path[1..-1]
    render "pages/#{@page_key}"
  end
end
