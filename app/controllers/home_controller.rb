class HomeController < ApplicationController
  layout 'theme'
  before_filter :load_photographer, :load_portfolios, :load_pages

  private #----

    def load_photographer
      @photographer = Photographer.first
    end

    def load_pages
      @pages = Page.order(:position)
    end

    def load_portfolios
      @portfolios = Portfolio.order(:position)
    end

end