class PortfoliosController < HomeController
  inherit_resources
  actions :show
  respond_to :html, :xml

  # def show
  #   @portfolio = Portfolio.find(params[:id])
  #
  #   respond_to do |format|
  #     format.html do
  #       template = parse_template('portfolio.liquid')
  #       content = template.render('portfolio' => @portfolio)
  #       render_with_layout(content)
  #     end
  #     format.xml { render :xml => @portfolio }
  #     format.json { render :json => @portfolio }
  #   end
  # end

end
