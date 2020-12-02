class InstalacoesController < ApplicationController
  before_action :set_instalacao, only: [:show, :edit, :update, :destroy]

  # GET /instalacoes
  # GET /instalacoes.json
  def index
    @instalacoes = Instalacao.all
  end

  # GET /instalacoes/1
  # GET /instalacoes/1.json
  def show
  end

  # GET /instalacoes/new
  def new
    @instalacao = Instalacao.new
    @veiculo = Veiculo.find(params[:veiculo_id])
    @franquia = @veiculo.usuario.franquia
  end

  # GET /instalacoes/1/edit
  def edit
  end

  # POST /instalacoes
  # POST /instalacoes.json
  def create
    @instalacao = Instalacao.new(instalacao_params)
    @veiculo = Veiculo.find(instalacao_params[:veiculo_id])
    @franquia = @veiculo.usuario.franquia
    respond_to do |format|
      if @instalacao.save
        format.html { redirect_to @instalacao, notice: 'Instalação foi criada com sucesso.' }
        format.json { render veiculo_path(@veiculo), status: :created, location: @instalacao }
      else
        format.html { render :new }
        format.json { render json: @instalacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instalacoes/1
  # PATCH/PUT /instalacoes/1.json
  def update
    respond_to do |format|
      if @instalacao.update(instalacao_params)
        format.html { redirect_to @instalacao, notice: 'Instalação foi atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @instalacao }
      else
        format.html { render :edit }
        format.json { render json: @instalacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instalacoes/1
  # DELETE /instalacoes/1.json
  def destroy
    @instalacao.destroy
    respond_to do |format|
      format.html { redirect_to instalacoes_url, notice: 'Instalação deletada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instalacao
      @instalacao = Instalacao.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def instalacao_params
      params.require(:instalacao).permit(:veiculo_id, :oficina_id)
    end
end
