class NestsController < ApplicationController
  before_action :set_nest, only: [:show, :edit, :update, :destroy]

  # GET /nests
  # GET /nests.json
  def index
    @nests = Nest.all
  end

  # GET /nests/1
  # GET /nests/1.json
  def show
  end

  # GET /nests/new
  def new
    @nest = Nest.new
  end

  # GET /nests/1/edit
  def edit
  end

  # POST /nests
  # POST /nests.json
  def create
    @nest = Nest.new(nest_params)

    respond_to do |format|
      if @nest.save
        format.html { redirect_to @nest, notice: 'Nest was successfully created.' }
        format.json { render :show, status: :created, location: @nest }
      else
        format.html { render :new }
        format.json { render json: @nest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nests/1
  # PATCH/PUT /nests/1.json
  def update
    respond_to do |format|
      if @nest.update(nest_params)
        format.html { redirect_to @nest, notice: 'Nest was successfully updated.' }
        format.json { render :show, status: :ok, location: @nest }
      else
        format.html { render :edit }
        format.json { render json: @nest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nests/1
  # DELETE /nests/1.json
  def destroy
    @nest.destroy
    respond_to do |format|
      format.html { redirect_to nests_url, notice: 'Nest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nest
      @nest = Nest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nest_params
      params.require(:nest).permit(:make, :location)
    end
end
