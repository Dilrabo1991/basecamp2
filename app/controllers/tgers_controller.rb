class TgersController < ApplicationController
  before_action :set_tger, only: %i[ show edit update destroy ]
  before_action :set_tg, only: %i[ new index show edit ]
  # GET /tgers or /tgers.json
  def index
    @tgers = Tger.all
  end

  # GET /tgers/1 or /tgers/1.json
  def show
  end

  # GET /tgers/new
  def new
    @tger = @tg.tgers.new
  end

  # GET /tgers/1/edit
  def edit
  end

  # POST /tgers or /tgers.json
  def create
    @tger = Tger.new(tger_params)

    respond_to do |format|
      if @tger.save
        format.html { redirect_to tg_path(@tger.tg_id), notice: "Tger was successfully created." }
        format.json { render :show, status: :created, location: @tger }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tger.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tgers/1 or /tgers/1.json
  def update
    respond_to do |format|
      if @tger.update(tger_params)
        format.html { redirect_to tger_url(@tger), notice: "Tger was successfully updated." }
        format.json { render :show, status: :ok, location: @tger }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tgers/1 or /tgers/1.json
  def destroy
    @tger.destroy

    respond_to do |format|
      format.html { redirect_to tgers_url, notice: "Tger was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tger
      @tger = Tger.find(params[:id])
    end

    def set_tg
      @tg = Tg.find(params[:tg_id])
    end

    # Only allow a list of trusted parameters through.
    def tger_params
      params.require(:tger).permit(:title, :tg_id)
    end
end
