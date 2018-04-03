class SparrowsController < ApplicationController
  before_action :set_sparrow, only: [:show, :edit, :update, :destroy]

  # GET /sparrows
  # GET /sparrows.json
  def index
    @sparrows = Sparrow.all
  end

  # GET /sparrows/1
  # GET /sparrows/1.json
  def show
  end

  # GET /sparrows/new
  def new
    @sparrow = Sparrow.new
  end

  # GET /sparrows/1/edit
  def edit
  end

  # POST /sparrows
  # POST /sparrows.json
  def create
    @sparrow = Sparrow.new(sparrow_params)

    respond_to do |format|
      if @sparrow.save
        format.html { redirect_to @sparrow, notice: 'Sparrow was successfully created.' }
        format.json { render :show, status: :created, location: @sparrow }
      else
        format.html { render :new }
        format.json { render json: @sparrow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sparrows/1
  # PATCH/PUT /sparrows/1.json
  def update
    respond_to do |format|
      if @sparrow.update(sparrow_params)
        format.html { redirect_to @sparrow, notice: 'Sparrow was successfully updated.' }
        format.json { render :show, status: :ok, location: @sparrow }
      else
        format.html { render :edit }
        format.json { render json: @sparrow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sparrows/1
  # DELETE /sparrows/1.json
  def destroy
    @sparrow.destroy
    respond_to do |format|
      format.html { redirect_to sparrows_url, notice: 'Sparrow was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sparrow
      @sparrow = Sparrow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sparrow_params
      params.require(:sparrow).permit(:name, :species)
    end
end
