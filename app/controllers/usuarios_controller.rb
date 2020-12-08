class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]
  before_action :set_atributos, only: [:show, :edit]
  before_action :authenticate_conta!, only: [:index, :edit, :update, :destroy]

  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.all
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
  end

  # GET /usuarios/1/edit
  def edit
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    isAllSave = false
    @usuario = Usuario.new(usuario_params)
    @usuario.cobranca = @usuario.associado ? 189 : 63
    @usuario.status = true
    if @usuario.indicacao != nil
      u = Usuario.find(@usuario.indicacao)
      @usuario.franquia = u.franquia
    else
      @usuario.errors.add(:indicacao, "não pode ser nula")
    end
    endereco = Endereco.new
    endereco.cep = params[:usuario][:cep]
    endereco.logradouro = params[:usuario][:logradouro]
    endereco.bairro = params[:usuario][:bairro]
    endereco.lote = params[:usuario][:numero]
    endereco.complemento = params[:usuario][:complemento]
    cidade = Cidade.find_by_nome(params[:usuario][:cidade]) ? Cidade.find_by_nome(params[:usuario][:cidade]) : Cidade.new(nome: params[:usuario][:cidade])
    estado = Estado.find_by_sigla params[:usuario][:estado]
    cidade.estado = estado
    endereco.usuario = @usuario
    Usuario.transaction do
      isAllSave = @usuario.save
      isAllSave = isAllSave ? cidade.save : false
      endereco.cidade = cidade
      isAllSave = isAllSave ? endereco.save : false
    end
    respond_to do |format|
      if isAllSave
        format.html { redirect_to @usuario, notice: 'Usuario foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new }
        format.json { render :json => @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to @usuario, notice: 'Usuario foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.status = false
    respond_to do |format|
      if @usuario.save
        format.html { redirect_to usuarios_url, notice: 'Usuario foi deletado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render :index }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_atributos
    @usuario = Usuario.find(params[:id])
    @endereco = @usuario.endereco
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_usuario
    @usuario = Usuario.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def usuario_params
    params.require(:usuario).permit(:nome, :rg, :cpf_cnpj, :email, :endereco_id, :telefone, :telefone_2, :cobranca, :tipo_usuario, :associado, :indicacao)
  end
end
