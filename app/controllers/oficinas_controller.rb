class OficinasController < ApplicationController
  before_action :set_oficina, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_conta!

  # GET /oficinas
  # GET /oficinas.json
  def index
    @oficinas = Oficina.all
  end

  # GET /oficinas/1
  # GET /oficinas/1.json
  def show
  end

  # GET /oficinas/new
  def new
    @oficina = Oficina.new
  end

  # GET /oficinas/1/edit
  def edit
  end

  # POST /oficinas
  # POST /oficinas.json
  def create
    @oficina = Oficina.new(oficina_params)
    endereco = Endereco.new
    endereco.cep = params[:oficina][:cep]
    endereco.logradouro = params[:oficina][:logradouro]
    endereco.bairro = params[:oficina][:bairro]
    endereco.lote = params[:oficina][:numero]
    endereco.complemento = params[:oficina][:complemento]
    cidade = Cidade.find_by_nome(params[:oficina][:cidade]) ? Cidade.find_by_nome(params[:oficina][:cidade]) : Cidade.new(nome: params[:oficina][:cidade])
    estado = Estado.find_by_sigla params[:oficina][:estado]
    cidade.estado = estado
    endereco.usuario = @oficina.usuario
    @oficina.franquia = @oficina.usuario.franquia
    cidade.save
    endereco.cidade = cidade
    if endereco.save!
      @oficina.endereco = endereco
      respond_to do |format|
        if @oficina.save
          format.html { redirect_to @oficina, notice: 'Oficina foi criada com sucesso.' }
          format.json { render :show, status: :created, location: @oficina }
        else
          format.html { render :new }
          format.json { render json: @oficina.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /oficinas/1
  # PATCH/PUT /oficinas/1.json
  def update
    respond_to do |format|
      if @oficina.update(oficina_params)
        format.html { redirect_to @oficina, notice: 'Oficina foi atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @oficina }
      else
        format.html { render :edit }
        format.json { render json: @oficina.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /oficinas/1
  # DELETE /oficinas/1.json
  def destroy
    @oficina.destroy
    respond_to do |format|
      format.html { redirect_to oficinas_url, notice: 'Oficina foi deletada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_oficina
    @oficina = Oficina.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def oficina_params
    params.require(:oficina).permit(:nome, :usuario_id)
  end
end
