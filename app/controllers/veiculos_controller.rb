class VeiculosController < ApplicationController
  before_action :set_veiculo, only: [:show, :edit, :update, :destroy]

  def new
    @veiculo = Veiculo.new
    @usuario = Usuario.find(params[:id])
  end


  def create
    @veiculo = Veiculo.new(veiculo_params)

    respond_to do |format|
      if @veiculo.save
        format.html { redirect_to @veiculo, notice: 'Veiculo was successfully created.' }
        format.json { render usuarios_url(@veiculo.usuario), status: :created, location: @veiculo }
      else
        format.html { render :new }
        format.json { render json: @veiculo.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @veiculo.update(usuario_params)
        format.html { redirect_to @veiculo, notice: 'Veiculo was successfully updated.' }
        format.json { render usuarios_url(@veiculo.usuario), status: :ok, location: @veiculo }
      else
        format.html { render :edit }
        format.json { render json: @veiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @veiculo.destroy
    respond_to do |format|
      format.html { redirect_to veiculos_url, notice: 'Veiculo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_veiculo
    @veiculo = Veiculo.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def veiculo_params
    params.require(:veiculo).permit(:placa, :chassi, :renavan, :ano, :modelo, :usuario_id)
  end
end
