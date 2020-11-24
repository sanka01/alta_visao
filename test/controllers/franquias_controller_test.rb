require 'test_helper'

class FranquiasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @franquia = franquias(:one)
  end

  test "should get index" do
    get franquias_url
    assert_response :success
  end

  test "should get new" do
    get new_franquia_url
    assert_response :success
  end

  test "should create franquia" do
    assert_difference('Franquia.count') do
      post franquias_url, params: { franquia: { nome: @franquia.nome, usuario_id: @franquia.usuario_id } }
    end

    assert_redirected_to franquia_url(Franquia.last)
  end

  test "should show franquia" do
    get franquia_url(@franquia)
    assert_response :success
  end

  test "should get edit" do
    get edit_franquia_url(@franquia)
    assert_response :success
  end

  test "should update franquia" do
    patch franquia_url(@franquia), params: { franquia: { nome: @franquia.nome, usuario_id: @franquia.usuario_id } }
    assert_redirected_to franquia_url(@franquia)
  end

  test "should destroy franquia" do
    assert_difference('Franquia.count', -1) do
      delete franquia_url(@franquia)
    end

    assert_redirected_to franquias_url
  end
end
