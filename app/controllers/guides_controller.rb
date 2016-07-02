
  class GuidesController < ApplicationController

#    skip_before_filter :authenticate_user!, :only => [:show]

    before_action :set_guide, only: [:edit, :update, :create, :destroy]


    def index
      @guides = Guide.all.order(:text)
    end

#    # GET /guides/1
#    def show
#      @guide = Guide.where(:id => params[:id]).first
#      render :text=> @guide.text 
#    end

    def new
      @guide = Guide.new
    end

    # GET /guides/1/edit
    def edit
    end

    # POST /pages
    def create
      @guide = Guide.new(guide_params)
      if @guide.save
      else
        render guides_path
      end
    end


    # PATCH/PUT /guides/1
    def update
      if @guide.update(guide_params)
#on create redirect back to dashbard
        redirect_to guides_path, notice: 'guide item was successfully updated.'
      else
        render guides_path
      end
    end

    # DELETE /pages/1
    def destroy
      @guide.destroy
      redirect_to guides_url, notice: 'guide item was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_guide
        @guide = Guide.where(:id => params[:id]).first
      end

      # Only allow a trusted parameter "white list" through.
      def guide_params
        params.require(:guide).permit(:id, :preamble_id, :text, :postscript_id)
      end
  end

