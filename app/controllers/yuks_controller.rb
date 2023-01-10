class YuksController < ApplicationController
  before_action :set_yuk, only: %i[ show edit update destroy ]
  before_action :set_project, only: %i[ new edit destroy index ]

  # GET /yuks or /yuks.json
  def index
    @yuks = @project.yuks
    @yuk = @project.yuks.new

    
    @yuks.each do |yuk|
      if yuk.project.user != current_user 
        return redirect_to root_path
      end
      
    end
    
 
  end

  # GET /yuks/1 or /yuks/1.json
  def show
  end

  # GET /yuks/new
  def new
    @yuk = @project.yuks.new
  end

  # GET /yuks/1/edit
  def edit
  end

  # POST /yuks or /yuks.json
  def create
    @yuk = Yuk.new(yuk_params)

    respond_to do |format|
      if @yuk.save
        format.html { redirect_to project_yuks_path(@yuk.project), notice: "Yuk was successfully created." }
        format.json { render :show, status: :created, location: @yuk }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @yuk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /yuks/1 or /yuks/1.json
  def update
    respond_to do |format|
      if @yuk.update(yuk_params)
        format.html { redirect_to yuk_url(@yuk), notice: "Yuk was successfully updated." }
        format.json { render :show, status: :ok, location: @yuk }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @yuk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yuks/1 or /yuks/1.json
  def destroy
    @yuk.destroy

    respond_to do |format|
      format.html { redirect_to yuks_url, notice: "Yuk was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yuk
      @yuk = Yuk.find(params[:id])
    end
    
    def set_project
      @project = Project.find(params[:project_id])
    end

    # Only allow a list of trusted parameters through.
    def yuk_params
      params.require(:yuk).permit(:yuker,:project_id)
    end
end
