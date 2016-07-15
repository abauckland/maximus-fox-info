class ProductimportsController < ApplicationController

  def new
    @productimport = Productimport.new
  end

  def create
    @productimport = Productimport.new(params[:productimport])
    respond_to do |format|
  
      if @productimport.check(params[:productimport][:csv])
        @productimport.import(params[:productimport][:csv])
   
        flash[:notice] = 'CSV uploaded successfully'
        format.html { render :action => "index" }
        #format.xml  { render :xml => @productimport, :status => :created, :location => @productimport }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @productimport, :status => :unprocessable_entity }
      end
    end
  end


private
    # Never trust parameters from the scary internet, only allow the white list through.
  def productimport_params
    params.require(:productimport).permit(:action, :csv)
  end

end