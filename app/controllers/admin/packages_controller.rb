class Admin::PackagesController < Admin::HomeController
  inherit_resources
  actions :all, :except => :show
  respond_to :html
  before_filter :build_package_product_sizes, :only => [:new, :edit]
  
  # check ownership and redirect to collection path on create instead of show
  def create
    @package = current_photographer.packages.new(params[:package])
    create!{ collection_path }
  end
  
  # check ownership and redirect to collection path on update instead of show
  def update
    @package = current_photographer.packages.find(params[:id])
    update!{ collection_path }
  end
  
  # check ownership
  def destroy
    @package = current_photographer.packages.find(params[:id])
    destroy! do |success, failure|
      success.js { 
        flash[:notice] = ''
        render :json => {:title => 'Success', :message => 'Package was successfuly removed.'} 
      }
      failure.js { render :json => {:title => 'Error', :message => 'Ran into an error removing the package. Please try again later.'} }
    end
  end
  
  # check ownership and update an individual package's position
  def update_position
    begin
      package = current_photographer.packages.find(params[:id])
      package.insert_at(params[:position].to_i) # update the object's order
      render :json => {:title => 'Success', :message => 'The order was updated successfuly.'}
    rescue
      render :json => {:title => 'Error', :message => 'Ran into an error updating the order. Please try again.'}
    end
  end
  
  private #-------
    # Defining the collection explicitly for ordering
    def collection
      @packages ||= current_photographer.packages.find :all
    end
    
    def build_package_product_sizes
      @package = current_photographer.packages.find(params[:id])
      
      # load all product sizes for the photographer
      # TODO: fix ownership
      product_sizes = ProductSize.find :all, :order => 'product_id, position'
      
      # if we're missing colours, build them
      if product_sizes.size > @package.package_product_sizes.size
        for product_size in product_sizes
          exists = false
          # see if the product size association exists
          for package_product_size in @package.package_product_sizes
            if product_size.id == package_product_size.product_size_id
              exists = true # found it
              break # bail
            end
          end
          # build the new pattern colour unless it already exists
          @package.package_product_sizes.build(:product_size => product_size) unless exists
        end
      end
    end
    
end
