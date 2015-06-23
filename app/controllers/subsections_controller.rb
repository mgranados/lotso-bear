require 'barby'
require 'barby/barcode/code_128'
require 'barby/outputter/html_outputter'
require 'barby/outputter/ascii_outputter'
require 'chunky_png'
require "prawn/measurement_extensions"
require 'barby/outputter/png_outputter'
class SubsectionsController < ApplicationController
  before_action :set_subsection, only: [:show, :edit, :update, :destroy]

  # GET /subsections
  # GET /subsections.json
  def index
    @subsections = Subsection.all
  end

  def print_label
    section = Subsection.find_by_id(params[:id])
    barcode = Barby::Code128B.new(section.code) 
    blob = Barby::PngOutputter.new(barcode).to_png(height: 40) 
    File.open("app/assets/images/barcodes/subsections/#{section.id}.png", 'w'){|f| f.write blob }
    label = {:png => "app/assets/images/barcodes/subsections/#{section.id}.png", :code => section.code}
   
    Prawn::Document.generate("app/assets/pdf/barcodes_section.pdf", top_margin: 2.15.send(:cm), right_margin: 0.79.send(:cm), bottom_margin: 1.7.send(:cm), left_margin:  0.62.send(:cm) )do
      y_axis = 680
      bounding_box([20,y_axis], :width => 240, :height => 95) do
        image label[:png], :at => [35, 80]
        move_down 10
        text "#{label[:code]}",:align => :center
      end
    end

      file = open("app/assets/pdf/barcodes_section.pdf")
      send_file(file, :filename => "barcodes_section.pdf", :type => "application/pdf" , :disposition =>      "inline")
  end


  # GET /subsections/1
  # GET /subsections/1.json
  def show
  end

  # GET /subsections/new
  def new
    @subsection = Subsection.new
    @section = Section.find_by_id(params[:section_id])
  end

  # GET /subsections/1/edit
  def edit
  end

  # POST /subsections
  # POST /subsections.json
  def create
    @subsection = Subsection.new(subsection_params)
    @subsection.section_id = params[:section_id]

    respond_to do |format|
      if @subsection.save
        format.html { redirect_to @subsection, notice: 'Subsection was successfully created.' }
        format.json { render action: 'show', status: :created, location: @subsection }
      else
        format.html { render action: 'new' }
        format.json { render json: @subsection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subsections/1
  # PATCH/PUT /subsections/1.json
  def update
    respond_to do |format|
      if @subsection.update(subsection_params)
        format.html { redirect_to @subsection, notice: 'Subsection was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @subsection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subsections/1
  # DELETE /subsections/1.json
  def destroy
    @subsection.destroy
    respond_to do |format|
      format.html { redirect_to subsections_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subsection
      @subsection = Subsection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subsection_params
      params.require(:subsection).permit(:code, :name, :section_id)
    end
end
