require "application_system_test_case"

class UsuariosTest < ApplicationSystemTestCase
  setup do
    @usuario = usuarios(:one)
  end

  test "visiting the index" do
    visit usuarios_url
    assert_selector "h1", text: "Usuarios"
  end

  test "creating a Usuario" do
    visit usuarios_url
    click_on "New Usuario"

    check "Associado" if @usuario.associado
    fill_in "Cobranca", with: @usuario.cobranca
    fill_in "Cpf cnpj", with: @usuario.cpf_cnpj
    fill_in "Email", with: @usuario.email
    fill_in "Endereco", with: @usuario.endereco_id
    fill_in "Nome", with: @usuario.nome
    fill_in "Rg", with: @usuario.rg
    fill_in "Telefone", with: @usuario.telefone
    fill_in "Telefone 2", with: @usuario.telefone_2
    fill_in "Tipo usuario", with: @usuario.tipo_usuario
    click_on "Create Usuario"

    assert_text "Usuario was successfully created"
    click_on "Back"
  end

  test "updating a Usuario" do
    visit usuarios_url
    click_on "Edit", match: :first

    check "Associado" if @usuario.associado
    fill_in "Cobranca", with: @usuario.cobranca
    fill_in "Cpf cnpj", with: @usuario.cpf_cnpj
    fill_in "Email", with: @usuario.email
    fill_in "Endereco", with: @usuario.endereco_id
    fill_in "Nome", with: @usuario.nome
    fill_in "Rg", with: @usuario.rg
    fill_in "Telefone", with: @usuario.telefone
    fill_in "Telefone 2", with: @usuario.telefone_2
    fill_in "Tipo usuario", with: @usuario.tipo_usuario
    click_on "Update Usuario"

    assert_text "Usuario was successfully updated"
    click_on "Back"
  end

  test "destroying a Usuario" do
    visit usuarios_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Usuario was successfully destroyed"
  end
end
