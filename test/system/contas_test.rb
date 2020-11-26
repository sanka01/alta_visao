require "application_system_test_case"

class ContasTest < ApplicationSystemTestCase
  setup do
    @conta = contas(:one)
  end

  test "visiting the index" do
    visit contas_url
    assert_selector "h1", text: "Contas"
  end

  test "creating a Conta" do
    visit contas_url
    click_on "New Conta"

    fill_in "Franquia", with: @conta.franquia_id
    fill_in "Nivel permissao", with: @conta.nivel_permissao
    fill_in "Nome", with: @conta.nome
    fill_in "Oficina", with: @conta.oficina_id
    fill_in "Usuario", with: @conta.usuario_id
    click_on "Create Conta"

    assert_text "Conta was successfully created"
    click_on "Back"
  end

  test "updating a Conta" do
    visit contas_url
    click_on "Edit", match: :first

    fill_in "Franquia", with: @conta.franquia_id
    fill_in "Nivel permissao", with: @conta.nivel_permissao
    fill_in "Nome", with: @conta.nome
    fill_in "Oficina", with: @conta.oficina_id
    fill_in "Usuario", with: @conta.usuario_id
    click_on "Update Conta"

    assert_text "Conta was successfully updated"
    click_on "Back"
  end

  test "destroying a Conta" do
    visit contas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Conta was successfully destroyed"
  end
end
