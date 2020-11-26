class ContasController < ApplicationController
  before_action :set_conta, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_conta!

  # GET /contas
  # GET /contas.json
  def index
    @contas = Conta.all
  end

  # GET /contas/1
  # GET /contas/1.json
  def show
  end

  # GET /contas/new
  def new
    @conta = Conta.new
  end

  # GET /contas/1/edit
  def edit
  end

  # POST /contas
  # POST /contas.json
  def create
    @conta = Conta.new(conta_params)

    respond_to do |format|
      if @conta.save
        format.html { redirect_to @conta, notice: 'Conta was successfully created.' }
        format.json { render :show, status: :created, location: @conta }
      else
        format.html { render :new }
        format.json { render json: @conta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contas/1
  # PATCH/PUT /contas/1.json
  def update
    respond_to do |format|
      if @conta.update(conta_params)
        format.html { redirect_to @conta, notice: 'Conta was successfully updated.' }
        format.json { render :show, status: :ok, location: @conta }
      else
        format.html { render :edit }
        format.json { render json: @conta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contas/1
  # DELETE /contas/1.json
  def destroy
    @conta.destroy
    respond_to do |format|
      format.html { redirect_to contas_url, notice: 'Conta was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conta
      @conta = Conta.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def conta_params
      params.require(:conta).permit(:nome, :nivel_permissao, :usuario_id, :oficina_id, :franquia_id)
    end
end
