class FranquiasController < ApplicationController
  before_action :set_franquia, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_conta!

  # GET /franquias
  # GET /franquias.json
  def index
    if !current_conta.is_admin?
      redirect_to root_path
    end
    @franquias = Franquia.all
  end

  # GET /franquias/1
  # GET /franquias/1.json
  def show
  end

  # GET /franquias/new
  def new
    @franquia = Franquia.new
  end

  # GET /franquias/1/edit
  def edit
  end

  # POST /franquias
  # POST /franquias.json
  def create
    @franquia = Franquia.new(franquia_params)
    conta = Conta.where(usuario_id: @franquia.dono).first
    conta.franquia = @franquia
    conta.nivel_permissao =  Conta.nivel_permissoes["franqueado"]
    conta.save
    usuario = Usuario.find @franquia.dono
    usuario.franquia_id = 0
    usuario.save
    respond_to do |format|
      if @franquia.save
        format.html { redirect_to @franquia, notice: 'Franquia foi criada com sucesso.' }
        format.json { render :show, status: :created, location: @franquia }
      else
        format.html { render :new }
        format.json { render json: @franquia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /franquias/1
  # PATCH/PUT /franquias/1.json
  def update
    respond_to do |format|
      if @franquia.update(franquia_params)
        format.html { redirect_to @franquia, notice: 'Franquia foi atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @franquia }
      else
        format.html { render :edit }
        format.json { render json: @franquia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /franquias/1
  # DELETE /franquias/1.json
  def destroy
    @franquia.destroy
    respond_to do |format|
      format.html { redirect_to franquias_url, notice: 'Franquia foi deletada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_franquia
      @franquia = Franquia.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def franquia_params
      params.require(:franquia).permit(:nome, :usuario_id)
    end
end
