require 'test_helper'

class InstalacoesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @instalacao = instalacoes(:one)
  end

  test "should get index" do
    get instalacoes_url
    assert_response :success
  end

  test "should get new" do
    get new_instalacao_url
    assert_response :success
  end

  test "should create instalacao" do
    assert_difference('Instalacao.count') do
      post instalacoes_url, params: { instalacao: { oficina_id: @instalacao.oficina_id, veiculo_id: @instalacao.veiculo_id } }
    end

    assert_redirected_to instalacao_url(Instalacao.last)
  end

  test "should show instalacao" do
    get instalacao_url(@instalacao)
    assert_response :success
  end

  test "should get edit" do
    get edit_instalacao_url(@instalacao)
    assert_response :success
  end

  test "should update instalacao" do
    patch instalacao_url(@instalacao), params: { instalacao: { oficina_id: @instalacao.oficina_id, veiculo_id: @instalacao.veiculo_id } }
    assert_redirected_to instalacao_url(@instalacao)
  end

  test "should destroy instalacao" do
    assert_difference('Instalacao.count', -1) do
      delete instalacao_url(@instalacao)
    end

    assert_redirected_to instalacoes_url
  end
end
