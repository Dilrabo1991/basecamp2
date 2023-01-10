class IshbersController < ApplicationController
  before_action :set_ishber, only: %i[ show edit update destroy ]
  before_action :set_project, only: %i[ index new ]

  # GET /ishbers or /ishbers.json
  def index
    @ishbers = @project.ishbers
    @ishber = @project.ishbers.new

    
    @ishbers.each do |ishber|
      if ishber.project.user != current_user 
        return redirect_to root_path
      end
    end
  end

  # GET /ishbers/1 or /ishbers/1.json
  def show
  end

  # GET /ishbers/new
  def new
    @ishber = Ishber.new
  end

  # GET /ishbers/1/edit
  def edit
  end

  # POST /ishbers or /ishbers.json
  def create
    @ishber = Ishber.new(ishber_params)

    respond_to do |format|
      if @ishber.save
        format.html { redirect_to project_ishbers_path(@ishber.project) }
        format.json { render :show, status: :created, location: @ishber }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ishber.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ishbers/1 or /ishbers/1.json
  def update
    respond_to do |format|
      if @ishber.update(ishber_params)
        format.html { redirect_to ishber_url(@ishber) }
        format.json { render :show, status: :ok, location: @ishber }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ishber.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ishbers/1 or /ishbers/1.json
  def destroy
    @ishber.destroy

    respond_to do |format|
      format.html { redirect_to ishbers_url, notice: "Ishber was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ishber
      @ishber = Ishber.find(params[:id])
    end
    def set_project
      @project = Project.find(params[:project_id])
    end
    # Only allow a list of trusted parameters through.
    def ishber_params
      params.require(:ishber).permit(:title, :project_id)
    end
end
