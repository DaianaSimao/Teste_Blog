class PerfisController < ApplicationController
  before_action :set_perfil, only: %i[ show edit update destroy ]

  # GET /people or /people.json
  def index
    @perfis = Perfil.all
  end

  # GET /people/1 or /people/1.json
  def show
  end

  # GET /people/new
  def new
    @perfis = Perfil.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people or /people.json
  def create
    @perfil = Perfil.new(perfil_params)

    respond_to do |format|
      if @perfil.save
        format.html { redirect_to perfil_url(@perfil), notice: "Perfil was successfully created." }
        format.json { render :show, status: :created, location: @perfil }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @perfil.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    respond_to do |format|
      if @perfil.update(perfil_params)
        format.html { redirect_to perfil_url(@perfil), notice: "Perfil was successfully updated." }
        format.json { render :show, status: :ok, location: @perfil }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @perfil.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    @perfil.destroy

    respond_to do |format|
      format.html { redirect_to people_url, notice: "perfil was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_perfil
      @perfil = Perfil.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def perfil_params
      params.require(:perfil).permit(:nome, :sobrenome, :user_id)
    end
end
