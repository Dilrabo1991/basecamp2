class TgsController < ApplicationController
  before_action :set_tg, only: %i[ show edit update destroy ]
  before_action :set_project, only: %i[index new ]
  # GET /tgs or /tgs.json
  def index
    @tgs = @project.tgs
    @tgs.each do |tg|
      if tg.project.user != current_user
        redirect_to root_path
      end
    end
  end

  # GET /tgs/1 or /tgs/1.json
  def show
    @tger = @tg.tgers.new
    @tgers = @tg.tgers
  end

  # GET /tgs/new
  def new
    @tg = @project.tgs.new
  end

  # GET /tgs/1/edit
  def edit
  end

  # POST /tgs or /tgs.json
  def create
    @tg = Tg.new(tg_params)

    respond_to do |format|
      if @tg.save
        @tgp = @tg.project_id
        format.html { redirect_to project_tgs_path(@tgp), notice: "Tg was successfully created." }
        format.json { render :show, status: :created, location: @tg }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tgs/1 or /tgs/1.json
  def update
    respond_to do |format|
      if @tg.update(tg_params)
        format.html { redirect_to tg_url(@tg), notice: "Tg was successfully updated." }
        format.json { render :show, status: :ok, location: @tg }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tgs/1 or /tgs/1.json
  def destroy
    @tg.destroy

    respond_to do |format|
      format.html { redirect_to project_tgs_path(@tg.project_id), notice: "Tg was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tg
      @tg = Tg.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    # Only allow a list of trusted parameters through.
    def tg_params
      params.require(:tg).permit(:name, :description, :project_id)
    end
end
