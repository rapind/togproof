class HomeController < ApplicationController
  before_filter :load_portfolios, :load_pages

  # Landing page
  def index
  end

  # 404
  def not_found
    render :template => '/404', :status => :not_found
  end

  protected #------

    def load_portfolios
      @portfolios = Portfolio.order(:position)
    end

    def load_pages
      @pages = Page.order(:position)
    end

end