require "application_system_test_case"

class InstalacoesTest < ApplicationSystemTestCase
  setup do
    @instalacao = instalacoes(:one)
  end

  test "visiting the index" do
    visit instalacoes_url
    assert_selector "h1", text: "Instalacoes"
  end

  test "creating a Instalacao" do
    visit instalacoes_url
    click_on "New Instalacao"

    fill_in "Oficina", with: @instalacao.oficina_id
    fill_in "Veiculo", with: @instalacao.veiculo_id
    click_on "Create Instalacao"

    assert_text "Instalacao was successfully created"
    click_on "Back"
  end

  test "updating a Instalacao" do
    visit instalacoes_url
    click_on "Edit", match: :first

    fill_in "Oficina", with: @instalacao.oficina_id
    fill_in "Veiculo", with: @instalacao.veiculo_id
    click_on "Update Instalacao"

    assert_text "Instalacao was successfully updated"
    click_on "Back"
  end

  test "destroying a Instalacao" do
    visit instalacoes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Instalacao was successfully destroyed"
  end
end
