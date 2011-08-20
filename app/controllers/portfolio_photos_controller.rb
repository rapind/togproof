class PortfolioPhotosController < InheritedResources::Base

  def show
    portfolio = Portfolio.find(params[:portfolio_id])
    portfolio_photo = portfolio.portfolio_photos.find(params[:id])

    respond_to do |format|
      format.html do
        template = parse_template('portfolio_photo.liquid')
        content = template.render('portfolio' => portfolio, 'portfolio_photo' => portfolio_photo)
        render_with_layout(content)
      end
      format.xml { render :xml => portfolio_photo }
      format.json { render :json => portfolio_photo }
    end
  end

end
