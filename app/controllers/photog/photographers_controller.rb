class Photog::PhotographersController < Photog::HomeController

  # GET /photographers
  # GET /photographers.json
  def index
    @photographers = Photographer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @photographers }
    end
  end

  # GET /photographers/1
  # GET /photographers/1.json
  def show
    @photographer = Photographer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @photographer }
    end
  end

  # GET /photographers/new
  # GET /photographers/new.json
  def new
    @photographer = Photographer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @photographer }
    end
  end

  # GET /photographers/1/edit
  def edit
    @photographer = Photographer.find(params[:id])
  end

  # POST /photographers
  # POST /photographers.json
  def create
    @photographer = Photographer.new(params[:photographer])

    respond_to do |format|
      if @photographer.save
        format.html { redirect_to @photographer, :notice => 'Photographer was successfully created.' }
        format.json { render :json => @photographer, :status => :created, :location => @photographer }
      else
        format.html { render :action => "new" }
        format.json { render :json => @photographer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /photographers/1
  # PUT /photographers/1.json
  def update
    @photographer = Photographer.find(params[:id])

    respond_to do |format|
      if @photographer.update_attributes(params[:photographer])
        format.html { redirect_to @photographer, :notice => 'Photographer was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @photographer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /photographers/1
  # DELETE /photographers/1.json
  def destroy
    @photographer = Photographer.find(params[:id])
    @photographer.destroy

    respond_to do |format|
      format.html { redirect_to photographers_url }
      format.json { head :ok }
    end
  end
end
